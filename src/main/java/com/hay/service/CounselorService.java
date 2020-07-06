package com.hay.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hay.mapper.CounselorMapper;
import com.hay.pojo.Absent;
import com.hay.pojo.Counselor;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CounselorService {

    @Autowired
    CounselorMapper counselorMapper;

    public Counselor login(String username, String password) {
        return counselorMapper.login(username,password);
    }

    public Counselor counselorInfo(int cid) {
        return counselorMapper.counselorInfo(cid);
    }

    public PageInfo<Student> studentInfo(int pageNum, int cid) {
        PageHelper.startPage(pageNum, 5);
        List<Student> prizeList = counselorMapper.studentInfo(cid);
        PageInfo<Student> pageInfo = new PageInfo<>(prizeList);
        return pageInfo;
    }

    public PageInfo<Student> keyQueryStudent(int pageNum, int cid, String key, String value) {
        PageHelper.startPage(pageNum, 5);
        List<Student> prizeList = counselorMapper.keyQueryStudent(cid,key,value);
        PageInfo<Student> pageInfo = new PageInfo<>(prizeList);
        return pageInfo;
    }

    public int modifyPassword(String cid, String cpassword) {
        return counselorMapper.modifyPassword(cid,cpassword);
    }

    public PageInfo<Prize> studentPrizeInfo(int pageNum,int cid) {
        //分页开始
        PageHelper.startPage(pageNum, 5);
        List<Prize> prizeList = counselorMapper.studentPrizeInfo(cid);
        PageInfo<Prize> pageInfo = new PageInfo<>(prizeList);
        return pageInfo;
    }

    public PageInfo<Prize> getPrizeInfoByKey(int pageNum, int cid, String type, String value) {
        PageHelper.startPage(pageNum,5);
        List<Prize> prizeList = counselorMapper.getPrizeInfoByKey(cid,type,value);
        PageInfo<Prize> pageInfo = new PageInfo<>(prizeList);
        return  pageInfo;
    }

    public String findStudentByUsername(String username) {
        return counselorMapper.findStudentByUsername(username);
    }

    public int addStudentPrizeInfo(Prize prize,String sid) {
        return counselorMapper.addStudentPrizeInfo(prize,sid);
    }

    public PageInfo<Absent> getAbsentInfo(int cid, int pageNum) {
        PageHelper.startPage(pageNum,5);
        List<Absent> pageList = counselorMapper.getAbsentInfo(cid);
        PageInfo<Absent> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public Map<String, String> getStudentByUsername(String username, String cid) {
        return counselorMapper.getStudentByUsername(username,cid);
    }

    public PageInfo<Absent> getAbsentInfoByKey(int pageNum, int cid, String type, String value) {
        PageHelper.startPage(pageNum,5);
        List<Absent> pageList = counselorMapper.getAbsentInfoByKey(cid,type,value);
        PageInfo<Absent> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public int addStudentAbsentInfo(Absent absent, String sid) {
        return counselorMapper.addStudentAbsentInfo(absent,sid);
    }


    public List<Map<String, Object>> exportStudentPrizeExcel(int cid) {
        return counselorMapper.exportStudentPrizeExcel(cid);
    }

    public List<Map<String, Object>> exportStudentAbsentExcel(int cid) {
        return counselorMapper.exportStudentAbsentExcel(cid);
    }

    public void deleteStudentPrize(String hid) {
        counselorMapper.deleteStudentPrize(hid);
    }

    public void deleteStudentAbsent(String kid){
        counselorMapper.deleteStudentAbsent(kid);
    }
}
