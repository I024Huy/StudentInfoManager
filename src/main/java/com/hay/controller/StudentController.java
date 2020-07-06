package com.hay.controller;

import com.github.pagehelper.PageInfo;
import com.hay.pojo.Family;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import com.hay.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/StudentHandler")
public class StudentController {

    @Autowired
    StudentService studentService;

    /**
     * 学生登陆
     * @param username
     * @param password
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public String studentLogin(String username, String password, HttpServletRequest request, HttpSession session){
        Student student = studentService.getStudentByUsernameAndPassword(username, password);
        if(student != null){
            session.setAttribute("student",student);
            return "student/studentFace";
        }else {
            request.setAttribute("msg","用户名或密码错误！");
            return "fail";
        }
    }

    /**
     * 学生退出登陆
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String studentLogout(HttpSession session){
        session.removeAttribute("student");
        return "redirect:/index.jsp";
    }

    /**
     * 查询学生的基本信息
     * @param sid
     * @return
     */
    @RequestMapping("/studentInfo/{sid}")
    public String getStudentInfo(@PathVariable("sid") String sid, Model model){
        Student student = studentService.getStudentInfoBySid(sid);
        model.addAttribute("student",student);
        return "student/queryVitaStu";
    }

    /**
     * 查询家庭信息
     * @param sid
     * @param model
     * @return
     */
    @RequestMapping("/familyInfo/{sid}")
    public String getFamilyInfoBySid(@PathVariable("sid") String sid,Model model){
        Family family = studentService.getFamilyInfoBySid(sid);
        if("1".equals(family.getFlag())){
            model.addAttribute("family",family);
            return "student/familyInfo";
        }else {
            model.addAttribute("fid",family.getFid());
            return "student/addFamily";
        }
    }

    /**
     * 添加家庭信息
     * @param sid
     * @param family
     * @return
     * @throws Exception
     */
    @RequestMapping("/addFamily")
    public String addFamily(String sid,int fid,Family family) throws Exception {
        String address = new String(family.getAddress().getBytes("iso-8859-1"),"utf-8");
        String name = new String(family.getFname().getBytes("iso-8859-1"),"utf-8");
        family.setFid(fid);
        family.setFname(name);
        family.setAddress(address);
        //设置标识，学生已修改过家庭信息表
        family.setFlag("1");
        //向家庭信息表添加数据
        int i = studentService.addFamily(family);
        //设置学生家庭信息的外键
        return "redirect:/StudentHandler/familyInfo/"+sid;
    }

    /**
     * 请求修改密码页面
     * @return
     */
    @RequestMapping("/changePassword")
    public String changePassword(){
        return "student/modifyPassword";
    }

    /**
     * 修改密码
     * @param sid
     * @param spassword
     * @return
     */
    @RequestMapping(value = "/modifyPassword")
    @ResponseBody
    public String modifyPassword(String sid,String spassword,HttpSession session){
        int i = studentService.modifyPassword(sid,spassword);
        if (i>0){
            session.removeAttribute("student");
            return "1";
        }else {
            return "0";
        }
    }

    /**
     * 分页获取学生的获奖信息
     * @param sid
     * @param pageNum:页码
     * @param model
     * @return
     */
    @RequestMapping("/getPrize/{sid}/{pageNum}")
    public String getPrize(@PathVariable("sid") String sid,@PathVariable("pageNum") int pageNum,Model model){
        PageInfo<Prize> pageInfo = studentService.getPrize(sid,pageNum);
        model.addAttribute("pageInfo",pageInfo);
        return "/student/prizeList";
    }
}
