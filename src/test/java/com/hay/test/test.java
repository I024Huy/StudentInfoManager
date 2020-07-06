package com.hay.test;

import com.hay.mapper.CounselorMapper;
import com.hay.mapper.StudentMapper;
import com.hay.pojo.Family;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import com.hay.service.CounselorService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.util.List;

@ContextConfiguration("classpath:applicationContext-dao.xml")
//声明谁加载配置文件
@RunWith(value= SpringJUnit4ClassRunner.class)
public class test {

    @Autowired
    StudentMapper studentMapper;
    @Autowired
    DataSource connection;
    @Autowired
    CounselorService counselorService;
    @Autowired
    CounselorMapper counselorMapper;

    @Test
    public void testStudent(){
        System.out.println(connection);
        Student student = studentMapper.getStudentByUsernameAndPassword("3120190906549", "12345");
        System.out.println(student);
    }

    @Test
    public void test2(){
//        Student student = studentMapper.getStudentInfoBySid("1");
//        System.out.println(student);
//        Family family = studentMapper.getFamilyInfoBySid("1");
//        System.out.println(family);
        Family family = new Family(null,"四川","lisi","1",40,"11111");

//        int a = studentMapper.addFamily(family);
//        System.out.println(""+a+":"+family);
//        List<Prize> prize = studentMapper.getPrize(1);
//        System.out.println(prize.toArray().toString());
        List<Prize> prizes = counselorMapper.studentPrizeInfo(1);
        System.out.println(prizes.toArray().toString());
    }

}
