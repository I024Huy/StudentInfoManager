package com.hay.mapper;

import com.hay.pojo.Admin;
import com.hay.pojo.Counselor;
import com.hay.pojo.Family;
import com.hay.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MyAdminMapper {

    /**
     * 登陆查询管理员
     * @param username
     * @param password
     * @return
     */
    Admin adminLogin(@Param("username") String username, @Param("password") String password);

    /**
     * 查询所有的学生信息
     * @return
     */
    List<Student> queryStudentInfoList();

    /**
     * 关键属性查询学生信息
     * @param key
     * @param value
     * @return
     */
    List<Student> queryStudentInfoListByKeyWorld(@Param("key") String key, @Param("value") String value);

    /**
     * 根据学号sid查询学生信息
   * @param sid
     * @return
     */
    Student getStudentInfoBySid(String sid);

    /**
     * 根据专业号zid查询专业名称
     * @param zid
     * @return
     */
    Map<String,String> getProfessionById(String zid);

    /**
     * 根据辅导员号username查询辅导员名字和电话
     * @param username
     * @return
     */
    Map<String, String> getCounselorById(String username);

    /**
     * 存储学生信息的修改
     * @param student
     * @param cid:辅导员号
     * @param oldUsername:旧学号
     * @return
     */
    int saveStudentInfo(@Param("student")Student student, @Param("cid") String cid,@Param("oldUsername") String oldUsername);

    /**
     * 删除学生时，查询学生是否有家庭信息
     * @param sid
     * @return
     */
    Map<String, Integer> getStudentFamilyId(String sid);

    /**
     * 置空专业和辅导员
     * @param sid
     * @return
     */
    int setNullPandCounselor(String sid);

    /**
     * 删除学生的缺旷情况
     * @param sid
     */
    void deleteStudentAbsent(String sid);

    /**
     * 删除学生的获奖信息
     * @param sid
     */
    void deleteStudentPrize(String sid);

    /**
     * 删除学生
     * @param sid
     * @return
     */
    void deleteStudent(String sid);

    /**
     * 删除学生的家庭信息
     * @param fid
     */
    void deleteStudentFamily(String fid);

    /**
     * 获取辅导员的主键cid
     * @param username
     * @return
     */
    String getCounselorId( String username);




    /**
     * 修改管理员密码
     * @param aid
     * @param password
     * @return
     */
    int modifyPassword(@Param("aid") String aid, @Param("password") String password);

    /**
     * 未学生创建family对象
    * @param family
     */
    void createStudentFamilyId(Family family);

    /**
     * 添加学生信息
     * @param student
     * @param zid
     * @param cid
     */
    void addStudentInfo(@Param("student") Student student,@Param("fid") String fid, @Param("zid") String zid, @Param("cid") String cid);

    /**
     * 根据学号查询学生是否存在
     * @param username
     * @return
     */
    Integer getStudentByUsername(String username);
    /**
     * 查询辅导员信息
     * @return
     */
    List<Counselor> queryCounselorInfoList();

    /**
     * 关键列查询辅导员信息
     * @param key
     * @param value
     * @return
     */
    List<Counselor> keyQuery(@Param("key") String key, @Param("value") String value);

    /**
     * 根据cid查询辅导员信息
     * @param cid
     * @return
     */
    Map<String, String> getCounselorInfoByCid(String cid);

    /**
     * 修改保存辅导员信息
     * @param counselor
     */
    void saveCounselorInfo(Counselor counselor);

    /**
     * 置空此辅导员管辖学生的cid
     * @param cid
     */
    void setStudentCidNull(String cid);

    /**
     * 根据辅导员编号cid删除辅导员
     * @param cid
     */
    void deleteCounselorByCid(String cid);

    /**
     * 根据辅导员工号username查询是否已经存在此辅导员
     * @param username
     * @return
     */
    Integer getCounselorByUsername(String username);

    /**
     * 添加辅导员信息
     * @param counselor
     */
    void addCounselorInfo(Counselor counselor);

    /**
     * 导出学生表
     * @return
     */
    List<Map<String, Object>> exportStudentExcel();

    /**
     * 导出辅导员表
     * @return
     */
    List<Map<String, Object>> exportCounselorExcel();
}
