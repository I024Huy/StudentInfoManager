package com.hay.controller;

import com.github.pagehelper.PageInfo;
import com.hay.pojo.Absent;
import com.hay.pojo.Counselor;
import com.hay.pojo.Prize;
import com.hay.pojo.Student;
import com.hay.service.CounselorService;
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
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/CounselorHandler")
public class CounselorController {

    @Autowired
    CounselorService counselorService;
    private excelUtils ExcelUtil = new excelUtils();

    /**
     * 辅导员登陆
     * @param username
     * @param password
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String CouLogin(String username, String password, HttpSession session, Model model){
        Counselor counselor = counselorService.login(username,password);
        if (counselor != null){
            session.setAttribute("counselor",counselor);
            return "counselor/counselorFace";
        }else {
            model.addAttribute("msg","用户名或密码错误");
            return "fail";
        }
    }

    /**
     * 辅导员注销
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("counselor");
        return "redirect:/index.jsp";
    }

    /**
     * 查询辅导与信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/counselorInfo")
    public String getCounselorInfo(HttpSession session, Model model){
        Counselor c = (Counselor) session.getAttribute("counselor");
        int cid = c.getCid();
        Counselor counselor = counselorService.counselorInfo(cid);
        model.addAttribute("counselor",counselor);
        return "counselor/counselorInfo";
    }

    /**
     * 分页查询学生信息
     * @param pageNum
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/studentInfo/{pageNum}")
    public String studentInfo(@PathVariable("pageNum") int pageNum,HttpSession session, Model model){
        Counselor counselor = (Counselor)session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Student> pageInfo = counselorService.studentInfo(pageNum,cid);
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/queryStudent";
    }

    @RequestMapping("/keyQueryStudent/{pageNum}")
    public String keyQueryStudent(String key, String value,@PathVariable("pageNum") int pageNum, HttpSession session, Model model){
        //在session中获取辅导员编号cid，以便查出是本辅导员管理的学生
        Counselor counselor = (Counselor)session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Student> pageInfo = null;
        //如果关键字是all，即查询全部，调用studentInfo方法
        if ("all".equals(key)){
            pageInfo = counselorService.studentInfo(pageNum,cid);
        }else {
            pageInfo = counselorService.keyQueryStudent(pageNum,cid,key,value);
        }
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/queryStudent";
    }

    @RequestMapping("/changePassword")
    public String changePassword(){
        return "counselor/modifyPassword";
    }

    /**
     * 辅导员修改密码
     * @param cid
     * @param cpassword
     * @param session
     * @return
     */
    @RequestMapping("/modifyPassword")
    @ResponseBody
    public String modifyPassword(String cid,String cpassword,HttpSession session){
        int i = counselorService.modifyPassword(cid,cpassword);
        if(i>0){
            //修改成功，重新登陆
            session.removeAttribute("counselor");
            return "1";
        }else {
            return "0";
        }
    }

    /**
     * 查询辅导员所管理学生中的获奖信息
     * @param pageNum:页码
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/studentPrize/{pageNum}")
    public String studentPrizeInfo(@PathVariable("pageNum") int pageNum,HttpSession session,Model model){
        Counselor counselor = (Counselor)session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Prize> pageInfo = counselorService.studentPrizeInfo(pageNum,cid);
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/studentPrizeInfo";
    }

    @RequestMapping("/deleteStudentPrize/{hid}")
    public String deleteStudentPrize(@PathVariable("hid") String hid, HttpSession session, Model model){
        counselorService.deleteStudentPrize(hid);
        Counselor counselor = (Counselor)session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Prize> pageInfo = counselorService.studentPrizeInfo(1,cid);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","修改成功");
        return "counselor/studentPrizeInfo";
    }

    /**
     * 根据选择的关键字查询学生的获奖信息
     * @param cid   辅导员id
     * @param type  字段名
     * @param value 字段值
     * @param pageNum   页码
     * @param model
     * @return
     */
    @RequestMapping("/keyQuery/{pageNum}")
    public String keyQuery(int cid,String type,String value,@PathVariable("pageNum") int pageNum,Model model){
        PageInfo<Prize> pageInfo = null;
        //如果选择的查询全部，或者值为空，则查询全部
        if(type == null || value == null || value=="" || "all".equals(type)){
            pageInfo = counselorService.studentPrizeInfo(pageNum,cid);
        }else {
            pageInfo = counselorService.getPrizeInfoByKey(pageNum,cid,type,value);
        }
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/studentPrizeInfo";
    }

    @RequestMapping("/addStudentPrizeView")
    public String addStudentPrizeViewNoUsername(){
        return "counselor/addStudentPrizeInfo";
    }

    @RequestMapping("/addStudentPrizeView/{username}/{name}")
    public String addStudentPrizeView(@PathVariable("username") String username,@PathVariable("name") String name,Model model) throws UnsupportedEncodingException {
        String sname = new String(name.getBytes("iso-8859-1"),"utf-8");
        model.addAttribute("username",username);
        model.addAttribute("name",sname);
        return "counselor/addStudentPrizeInfo";
    }

    /**
     * 添加学生的获奖信息
     * @param prize 获奖信息
     * @param username  学生学号
     * @param model
     * @return
     */
    @RequestMapping("/addStudentPrizeInfo")
    public String addStudentPrizeInfo(Prize prize,String username, Model model){
        //通过学生学号username获取学生编号sid
        String sid = counselorService.findStudentByUsername(username);
        //存入一条学生信息
        int i = counselorService.addStudentPrizeInfo(prize,sid);
        if (i>0){
            model.addAttribute("msg","添加成功！");
            return "counselor/addStudentPrizeInfo";
        }else {
            model.addAttribute("msg","添加失败！");
            return "fail";
        }
    }

    @RequestMapping("/getStudentByUsername")
    @ResponseBody
    public Map<String,String> getStudentByUsername(String username, String cid){
        Map<String,String> map = counselorService.getStudentByUsername(username,cid);
        return map;
    }

    /**
     * 学生缺旷信息查询
     * @param pageNum
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/absentInfo/{pageNum}")
    public String absentInfo(@PathVariable("pageNum") int pageNum,HttpSession session,Model model){
        Counselor counselor = (Counselor) session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Absent> pageInfo = counselorService.getAbsentInfo(cid,pageNum);
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/absentInfo";
    }

    /**
     * 删除学生缺旷情况
     * @param kid
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/deleteStudentAbsent/{kid}")
    public String deleteStudentAbsent(@PathVariable("kid") String kid, HttpSession session, Model model){
        counselorService.deleteStudentAbsent(kid);
        Counselor counselor = (Counselor) session.getAttribute("counselor");
        int cid = counselor.getCid();
        PageInfo<Absent> pageInfo = counselorService.getAbsentInfo(cid,1);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("msg","修改成功");
        return "counselor/absentInfo";
    }

    /**
     * 根据选中字段查询学生缺旷信息
     * @param cid
     * @param type
     * @param value
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/keyQueryAbsent/{pageNum}")
    public String keyQueryAbsent(int cid,String type,String value,@PathVariable("pageNum") int pageNum,Model model){
        PageInfo<Absent> pageInfo = null;
        //如果选择的查询全部，或者值为空，则查询全部
        if(type == null || value == null || value == "" || "all".equals(type)){
            pageInfo = counselorService.getAbsentInfo(pageNum,cid);
        }else {
            pageInfo = counselorService.getAbsentInfoByKey(pageNum,cid,type,value);
        }
        model.addAttribute("pageInfo",pageInfo);
        return "counselor/absentInfo";
    }

    @RequestMapping("/addStudentAbsentView")
    public String addAbsentInfoViewNoUsername(){
        return "counselor/addStudentAbsentInfo";
    }

    /**
     * 添加学生的缺旷情况
     * @param username
     * @param name
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("addStudentAbsentView/{username}/{name}")
    public String addAbsentInfoView(@PathVariable("username") String username,@PathVariable("name") String name,Model model) throws UnsupportedEncodingException {
        String sname = new String(name.getBytes("iso-8859-1"),"utf-8");
        model.addAttribute("username",username);
        model.addAttribute("name",sname);
        return "counselor/addStudentAbsentInfo";
    }

    /**
     * 添加学生缺旷信息
     * @param absent
     * @param username
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/addStudentAbsentInfo")
    public String addStudentAbsentInfo(Absent absent,String username, HttpSession session,Model model){

        //查询此学生的sid
        String sid = counselorService.findStudentByUsername(username);
        int i = counselorService.addStudentAbsentInfo(absent,sid);
        if (i>0){
            model.addAttribute("msg","添加成功！");
            return "counselor/addStudentAbsentInfo";
        }else {
            model.addAttribute("msg","添加失败！");
            return "fail";
        }
    }

    @RequestMapping("/exportStudentExcel/{name}")
    @ResponseBody
    public Map<String,Object> exportStudentExcel(@PathVariable("name") String name, HttpServletResponse response, HttpSession session){
        Counselor counselor = (Counselor) session.getAttribute("counselor");
        int cid = counselor.getCid();
        try {
            //获取导出到excel 的数据
            //sql查询的时候，要将查询出的每个字段起个别名 别名的格式必须是 从0开始依次递增
            //例如      select id '0', userName '1', userPhone '2', userAddress '3'  from user
            List<Map<String, Object>> exportDataList = null;
            String[] title = null;
            String fileName = null;
            String sheetName = null;
            if ("prize".equals(name)){
                exportDataList = counselorService.exportStudentPrizeExcel(cid);
                //设置excel标题   查询几个字段，就写几个标题，标题顺序跟0123对应
                title = new String[]{"学生学号", "学生姓名", "性别", "获奖名称", "获奖等级", "获奖时间", "所在班级", "所在年级", "所在学院", "所在专业", "所在寝室"};
                //excel文件名
                SimpleDateFormat df = new SimpleDateFormat("MM月dd日HH时mm分");// 设置日期格式
                fileName = "学生获奖表("+df.format(new Date())+").xls";
                //sheet名
                sheetName = "学生获奖表";
            }
            if ("absent".equals(name)){
                exportDataList = counselorService.exportStudentAbsentExcel(cid);
                //设置excel标题   查询几个字段，就写几个标题，标题顺序跟0123对应
                title = new String[]{"学生学号", "学生姓名", "性别", "缺旷课程名称", "缺旷时间", "缺旷原因", "所在班级", "所在年级", "所在学院", "所在专业", "所在寝室"};
                //excel文件名
                SimpleDateFormat df = new SimpleDateFormat("MM月dd日HH时mm分");// 设置日期格式
                fileName = "学生缺旷表("+df.format(new Date())+").xls";
                //sheet名
                sheetName = "学生缺旷表";
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
