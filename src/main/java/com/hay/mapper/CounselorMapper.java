package com.hay.mapper;

import com.hay.pojo.Absent;
import com.hay.pojo.Counselor;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CounselorMapper {
    /**
     * 辅导员登陆
     * @param username
     * @param password
     * @return
     */
    Counselor login(@Param("username") String username, @Param("password") String password);

    /**
     * 查询辅导员个人信息
     * @param cid
     * @return
     */
    Counselor counselorInfo(int cid);

    /**
     * 查询学生信息
     * @param cid
     * @return
     */
    List<Student> studentInfo(int cid);

    /**
     * 关键词查询学生信息
     * @param cid
     * @param key
     * @param value
     * @return
     */
    List<Student> keyQueryStudent(@Param("cid") int cid,@Param("key") String key,@Param("value") String value);

    /**
     * 修改辅导员密码
     * @param cid
     * @param cpassword
     * @return
     */
    int modifyPassword(@Param("cid") String cid, @Param("cpassword") String cpassword);

    /**
     * 查询所有的学生获奖信息
     * @return
     */
    List<Prize> studentPrizeInfo(int cid);

    /**
     * 根据关键字查询学生获奖信息
     * @param cid   : 查询此辅导员管理的学生中的数据
     * @param type : 根据什么字段查询
     * @param value : 此字段的值为多少
     * @return
     */
    List<Prize> getPrizeInfoByKey(@Param("cid") int cid, @Param("type") String type, @Param("value") String value);

    /**
     * 添加学生获奖信息时，判断此学生是否是此老师的学生
     * @param username
     * @return
     */
    String findStudentByUsername(String username);

    /**
     * 添加学生获奖信息
     * @param prize
     * @param sid
     * @return
     */
    int addStudentPrizeInfo(@Param("prize") Prize prize, @Param("sid") String sid);

    /**
     * 根据学号查询学生是否存在
     * @param username
     * @param cid
     * @return
     */
    Map<String, String> getStudentByUsername(@Param("username") String username, @Param("cid") String cid);

    /**
     * 查询此辅导员管理的所有学生的缺旷情况
     * @param cid
     * @return
     */
    List<Absent> getAbsentInfo(int cid);

    List<Absent> getAbsentInfoByKey(@Param("cid") int cid, @Param("type") String type, @Param("value") String value);

    /**
     * 添加学生缺旷情况
     * @param absent
     * @param sid
     * @return
     */
    int addStudentAbsentInfo(@Param("absent") Absent absent, @Param("sid") String sid);


    /**
     * 导出学生获奖表
     * @param cid
     * @return
     */
    List<Map<String, Object>> exportStudentPrizeExcel(int cid);

    /**
     * 导出学生缺旷表
     * @param cid
     * @return
     */
    List<Map<String, Object>> exportStudentAbsentExcel(int cid);

    /**
     * 删除学生获奖信息
     * @param hid
     */
    void deleteStudentPrize(String hid);

    /**
     * 删除学生缺旷信息
     * @param kid
     */
    void deleteStudentAbsent(String kid);
}
