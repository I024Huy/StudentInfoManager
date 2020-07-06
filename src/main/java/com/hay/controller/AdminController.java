package com.hay.controller;

import com.github.pagehelper.PageInfo;
import com.hay.pojo.Admin;
import com.hay.pojo.Counselor;
import com.hay.pojo.Student;
import com.hay.service.AdminService;
import com.hay.utils.excelUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/AdminHandler")
public class AdminController {
    @Autowired
    AdminService adminService;
    private excelUtils ExcelUtil = new excelUtils();


    /**
     * 管理员登陆
     * @param username
     * @param password
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String adminLogin(String username, String password, HttpSession session, Model model){
        Admin admin = adminService.adminLogin(username,password);
        if (admin != null){
            session.setAttribute("admin",admin);
            return "admin/adminFace";
        }else {
            model.addAttribute("msg","登陆失败");
            return "fail";
        }

    }

    /**
     * 管理员注销
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String adminLogout(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/index.jsp";
    }

    /**
     * 分页查询学生信息
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/studentManager/queryStudentInfoList/{pageNum}")
    public String queryStudentInfoList(@PathVariable("pageNum") int pageNum, Model model){
        PageInfo<Student> pageInfo = adminService.queryStudentInfoList(pageNum);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/queryStudent";
    }

    /**
     * 关键列查询学生信息
     * @param key
     * @param value
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/studentManager/queryStudentInfoListByKeyWorld/{pageNum}")
    public String queryStudentInfoListByKeyWorld(String key, String value, @PathVariable("pageNum") int pageNum, Model model){
        PageInfo<Student> pageInfo = null;
        if ("all".equalsIgnoreCase(key)){
            pageInfo = adminService.queryStudentInfoList(pageNum);

        }else {
            pageInfo = adminService.queryStudentInfoListByKeyWorld(key,value,pageNum);
        }
        model.addAttribute("pageInfo",pageInfo);
        return "admin/queryStudent";
    }

    /**
     * 通过sid查询学生信息
     * @param sid
     * @return
     */
    @RequestMapping("/studentManager/getStudentInfoBySid")
    @ResponseBody
    public Student getStudentInfoBySid(String sid){
        Student student = adminService.getStudentInfoBySid(sid);
        return student;
    }

    /**
     * 通过专业编号zid查询专业信息和学院信息
     * @param zid
     * @return
     */
    @RequestMapping("/studentManager/getProfessionById")
    @ResponseBody
    public Map<String,String> getProfessionById(String zid){
        Map<String,String> name = adminService.getProfessionById(zid);
        if (name != null){
            return name;
        }else {
            return null;
        }
    }

    /**
     * 通过辅导员账号username查询辅导员信息
     * @param username
     * @return
     */
    @RequestMapping("/studentManager/getCounselorById")
    @ResponseBody
    public Map<String,String> getCounselorById(String username){
        Map<String,String> map = adminService.getCounselorById(username);
        if (map != null){
            return map;
        }else {
            return null;
        }
    }

    /**
     * 存储修改学生信息
     * @param student
     * @param oldUsername
     * @param model
     * @return
     */
    @RequestMapping("/studentManager/saveStudentInfo")
    public String saveStudentInfo(Student student,String oldUsername, Model model){
        int i = adminService.saveStudentInfo(student,oldUsername);
        PageInfo<Student> pageInfo = adminService.queryStudentInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        if(i>-1){
            model.addAttribute("msg","保存成功");
        }else {
            model.addAttribute("msg","保存失败,请重试");
        }
        return "admin/queryStudent";
    }

    /**
     * 新增学生信息
     * @param student
     * @param zid
     * @param cid
     * @param model
     * @return
     */
    @RequestMapping("/studentManager/addStudentInfo")
    public String addStudentInfo(Student student,String zid,String cid,Model model){
        //存储学生信息
        adminService.addStudentInfo(student,zid,cid);
        //查询最新信息进行展示
        PageInfo<Student> pageInfo = adminService.queryStudentInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","添加成功！");
        return "admin/queryStudent";
    }

    @RequestMapping("/studentManager/getStudentByUsername")
    @ResponseBody
    public String getStudentByUsername(String username){
        Integer i = adminService.getStudentByUsername(username);
        return i.toString();
    }
    /**
     * 根据学生编号sid删除学生信息
     * @param sid
     * @param model
     * @return
     */
    @RequestMapping("studentManager/deleteStudent/{sid}")
    public String deleteStudent(@PathVariable("sid") String sid,Model model){
        adminService.deleteStudent(sid);
        PageInfo<Student> pageInfo = adminService.queryStudentInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","删除成功！");
        return "admin/queryStudent";
    }

    /**
     * 获得修改管理员密码视图
     * @return
     */
    @RequestMapping("/changePasswordView")
    public String changePasswordView(){
        return "admin/modifyPassword";
    }

    /**
     * 修改管理员密码
     * @param aid
     * @param password
     * @return
     */
    @RequestMapping("/modifyPassword")
    @ResponseBody
    public String modifyPassword(String aid,String password){
        int i = adminService.modifyPassword(aid,password);
        if (i>0){
            return "1";
        }else {
            return "0";
        }
    }

    /**
     * 查询分页辅导员信息
     * @param pageNum 当前页
     * @param model
     * @return
     */
    @RequestMapping("/counselorManager/queryCounselorInfoList/{pageNum}")
    public String queryCounselorInfoList(@PathVariable("pageNum") int pageNum,Model model){
        PageInfo<Counselor> pageInfo = adminService.queryCounselorInfoList(pageNum);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/queryCounselor";
    }

    /**
     * 关键字查询
     * @param key   关键字
     * @param value 值
     * @param pageNum   当前页
     * @param model
     * @return
     */
    @RequestMapping("/counselorManager/keyQuery/{pageNum}")
    public String keyQuery(String key, String value, @PathVariable("pageNum") int pageNum, Model model){
        PageInfo<Counselor> pageInfo = null;
        if ("all".equals(key)){
            pageInfo = adminService.queryCounselorInfoList(pageNum);
        }else {
            pageInfo = adminService.keyQuery(key,value,pageNum);
        }
        model.addAttribute("pageInfo",pageInfo);
        return "admin/queryCounselor";
    }

    /**
     * 通过辅导员编号查询辅导员信息
     * @param cid   辅导员编号
     * @return
     */
    @RequestMapping("/counselorManager/getCounselorInfoByCid")
    @ResponseBody
    public Map<String,String> getCounselorInfoByCid(String cid){
        Map<String,String> map = adminService.getCounselorInfoByCid(cid);
        return map;
    }

    /**
     * 保存修改的辅导员信息
     * @param counselor 辅导员
     * @param model
     * @return
     */
    @RequestMapping("/counselorManager/saveCounselorInfo")
    public String saveCounselorInfo(Counselor counselor, Model model){
        adminService.saveCounselorInfo(counselor);
        PageInfo<Counselor> pageInfo = adminService.queryCounselorInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","修改成功！");
        return "admin/queryCounselor";
    }

    /**
     * 通过辅导员编号cid删除辅导员
     * @param cid   辅导员编号
     * @param model
     * @return
     */
    @RequestMapping("/counselorManager/deleteCounselorByCid/{cid}")
    public String deleteCounselorByCid(@PathVariable("cid") String cid, Model model){
        //删除辅导员信息
        adminService.deleteCounselorByCid(cid);
        //查询最新辅导员信息显示
        PageInfo<Counselor> pageInfo = adminService.queryCounselorInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","删除成功！");
        return "admin/queryCounselor";
    }

    /**
     * 通过辅导员工号获取辅导员信息
     * @param username 辅导员工号
     * @return
     */
    @RequestMapping("/counselorManager/getCounselorByUsername")
    @ResponseBody
    public String getCounselorByUsername(String username){
        Integer i = adminService.getCounselorByUsername(username);
        return i.toString();
    }

    /**
     * 添加辅导员信息
     * @param counselor 辅导员
     * @param model
     * @return
     */
    @RequestMapping("/counselorManager/addCounselorInfo")
    public String addCounselorInfo(Counselor counselor,Model model){
        adminService.addCounselorInfo(counselor);
        PageInfo<Counselor> pageInfo = adminService.queryCounselorInfoList(1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","添加成功！");
        return "admin/queryCounselor";
    }

    /**
     * 导出excel表格
     * @param name  导出哪个表格(prize/absent)
     * @param response
     * @return
     */
    @RequestMapping("/exportExcel/{name}")
    @ResponseBody
    public String exportExcel (@PathVariable("name") String name, HttpServletResponse response){
        try {
            //获取导出到excel 的数据
            //sql查询的时候，要将查询出的每个字段起个别名 别名的格式必须是 从0开始依次递增
            //例如      select id '0', userName '1', userPhone '2', userAddress '3'  from user
            List<Map<String, Object>> exportDataList = null;
            String[] title = null;
            String fileName = null;
            String sheetName = null;
            if ("student".equals(name)){
                exportDataList = adminService.exportStudentExcel();
                //设置excel标题   查询几个字段，就写几个标题，标题顺序跟0123对应
                title = new String[]{"学生学号", "学生姓名", "身份证号码", "性别", "密码", "年龄",
                        "所在班级", "所在年级", "所在专业", "所在学院", "所在寝室","学生号码","邮箱",
                        "监护人姓名","家庭住址","监护人性别","监护人年龄","监护人电话",
                        "辅导员工号","辅导员姓名","辅导员电话"};
                //excel文件名
                SimpleDateFormat df = new SimpleDateFormat("MM月dd日HH时mm分");// 设置日期格式
                fileName = "学生信息表("+df.format(new Date())+").xls";
                //sheet名
                sheetName = "学生信息表";
            }
            if ("counselor".equals(name)){
                exportDataList = adminService.exportCounselorExcel();
                //设置excel标题   查询几个字段，就写几个标题，标题顺序跟0123对应
                title = new String[]{"辅导员工号", "辅导员密码", "辅导员姓名", "辅导员性别", "辅导员年龄", "辅导员电话", "辅导员邮箱", "辅导员住址"};
                //excel文件名
                SimpleDateFormat df = new SimpleDateFormat("MM月dd日HH时mm分");// 设置日期格式
                fileName = "辅导员信息表("+df.format(new Date())+").xls";
                //sheet名
                sheetName = "辅导员信息表";
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, exportDataList, null);
            //响应到客户端
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
                response.setContentType("application/octet-stream;charset=ISO8859-1");
                response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
                response.addHeader("Pargam", "no-cache");
                response.addHeader("Cache-Control", "no-cache");
                OutputStream os = response.getOutputStream();
                wb.write(os);
                os.flush();
                os.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
