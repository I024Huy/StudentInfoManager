package com.hay.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hay.mapper.StudentMapper;
import com.hay.pojo.Family;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    //自动注入学生学生映射
    @Autowired
    StudentMapper studentMapper;

    public Student getStudentByUsernameAndPassword(String username,String password){
        return studentMapper.getStudentByUsernameAndPassword(username,password);
    }

    public Student getStudentInfoBySid(String sid) {
        return studentMapper.getStudentInfoBySid(sid);
    }

    public Family getFamilyInfoBySid(String sid) {
        return studentMapper.getFamilyInfoBySid(sid);
    }

    public int modifyPassword(String sid, String spassword) {
        return studentMapper.modifyPassword(sid,spassword);
    }

    public int addFamily(Family family) {
        return studentMapper.addFamily(family);
    }

    public void addStudentFid(String sid, Integer fid) {
        studentMapper.addStudentFid(sid,fid);
    }

    public PageInfo<Prize> getPrize(String sid, int pageNum) {
        //开始分页
        PageHelper.startPage(pageNum,5);
        //查询出所有数据，拿给插件分页
        List<Prize> prizeList = studentMapper.getPrize(sid);
        //插件分页
        PageInfo<Prize> pageInfo = new PageInfo<>(prizeList);
        return pageInfo;
    }
}
