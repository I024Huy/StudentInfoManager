package com.hay.mapper;

import com.hay.pojo.Family;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    /**
     * 登陆时查询学生是否存在
     * @param username
     * @param password
     * @return
     */
    Student getStudentByUsernameAndPassword(@Param("username") String username,@Param("password")  String password);

    /**
     * 查询学生的基本信息
     * @param sid
     * @return
     */
    Student getStudentInfoBySid(String sid);

    /**
     * 查询学生的家庭信息情况
     * @param sid
     * @return
     */
    Family getFamilyInfoBySid(String sid);

    /**
     * 修改学生的密码
     * @param sid
     * @param spassword
     */
    int modifyPassword(@Param("sid") String sid, @Param("spassword") String spassword);

    /**
     * 添加学生家庭信息数据
     * @param family
     * @return
     */
    int addFamily(Family family);

    /**
     * 给学生添加家庭信息的外键fid
     * @param sid
     * @param fid
     */
    void addStudentFid(@Param("sid") String sid, @Param("fid") Integer fid);

    /**
     * 分页查询学生获奖情况
     * @param sid
     * @return
     */
    List<Prize> getPrize(String sid);
}
