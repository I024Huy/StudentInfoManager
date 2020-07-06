package com.hay.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hay.mapper.MyAdminMapper;
import com.hay.pojo.Admin;
import com.hay.pojo.Counselor;
import com.hay.pojo.Family;
import com.hay.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class AdminService {

    @Autowired
    MyAdminMapper myAdminMapper;

    public Admin adminLogin(String username, String password) {
        return myAdminMapper.adminLogin(username,password);
    }

    public PageInfo<Student> queryStudentInfoList(int pageNum) {
        //开始分页
        PageHelper.startPage(pageNum,8);
        //查询所有的学生信息
        List<Student> pageList = myAdminMapper.queryStudentInfoList();
        //生成分页对象
        PageInfo<Student> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public PageInfo<Student> queryStudentInfoListByKeyWorld(String key, String value, int pageNum) {
        PageHelper.startPage(pageNum,8);
        List<Student> pageList = myAdminMapper.queryStudentInfoListByKeyWorld(key,value);
        PageInfo<Student> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public Student getStudentInfoBySid(String sid) {
        return myAdminMapper.getStudentInfoBySid(sid);
    }

    public Map<String,String> getProfessionById(String zid) {
        return myAdminMapper.getProfessionById(zid);
    }

    public Map<String, String> getCounselorById(String username) {
        return myAdminMapper.getCounselorById(username);
    }

    /**
     * 开启事务修改学生信息
     * @param student
     * @param oldUsername
     * @return
     */
    @Transactional
    public int saveStudentInfo(Student student,String oldUsername) {
        //若此学生修改了学号，则通过OldUsername查询出此学生的编号sid
        String cid = myAdminMapper.getCounselorId(student.getCounselor().getUsername());
        return myAdminMapper.saveStudentInfo(student,cid,oldUsername);
    }

    /**
     * 开启事务删除学生信息(事先删除家庭情况)
     * @param sid
     * @return
     */
    @Transactional
    public void deleteStudent(String sid) {
        //查询学生是否存在家庭信息fid
        Map<String,Integer> map = myAdminMapper.getStudentFamilyId(sid);
        //置空此学生的家庭信息fid、所在专业zid和所属辅导员cid
        int i = myAdminMapper.setNullPandCounselor(sid);
        //删除此学生的所有获奖记录和缺旷情况
        myAdminMapper.deleteStudentAbsent(sid);
        myAdminMapper.deleteStudentPrize(sid);
        //删除此学生
        myAdminMapper.deleteStudent(sid);
        //如果学生有家庭信息，删除此家庭信息
        if (map.get("fid") != null){
            String fid = map.get("fid").toString();
            myAdminMapper.deleteStudentFamily(fid);
        }
    }


    public int modifyPassword(String aid, String password) {
        return myAdminMapper.modifyPassword(aid,password);
    }

    @Transactional
    public void addStudentInfo(Student student, String zid, String cid) {
        //为新创建的学生信息创建家庭信息
        Family family = new Family();
        //设置学生未编辑家庭信息表
        family.setFlag("0");
        myAdminMapper.createStudentFamilyId(family);
        String fid = family.getFid().toString();
        myAdminMapper.addStudentInfo(student,fid,zid,cid);
    }

    public Integer getStudentByUsername(String username) {
        return myAdminMapper.getStudentByUsername(username);
    }


    public PageInfo<Counselor> queryCounselorInfoList(int pageNum) {
        PageHelper.startPage(pageNum,8);
        List<Counselor> pageList = myAdminMapper.queryCounselorInfoList();
        PageInfo<Counselor> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public PageInfo<Counselor> keyQuery(String key, String value, int pageNum) {
        PageHelper.startPage(pageNum,8);
        List<Counselor> pageList = myAdminMapper.keyQuery(key,value);
        PageInfo<Counselor> pageInfo = new PageInfo<>(pageList);
        return pageInfo;
    }

    public Map<String, String> getCounselorInfoByCid(String cid) {
        return myAdminMapper.getCounselorInfoByCid(cid);
    }

    public void saveCounselorInfo(Counselor counselor) {
        myAdminMapper.saveCounselorInfo(counselor);
    }

    @Transactional
    public void deleteCounselorByCid(String cid) {
        //将此辅导员管辖的所有学生cid置空
        myAdminMapper.setStudentCidNull(cid);
        //删除辅导员
        myAdminMapper.deleteCounselorByCid(cid);
    }

    public Integer getCounselorByUsername(String username) {
        return myAdminMapper.getCounselorByUsername(username);
    }

    public void addCounselorInfo(Counselor counselor) {
        myAdminMapper.addCounselorInfo(counselor);
    }


    public List<Map<String, Object>> exportStudentExcel() {
        return myAdminMapper.exportStudentExcel();
    }

    public List<Map<String, Object>> exportCounselorExcel() {
        return myAdminMapper.exportCounselorExcel();
    }


}
