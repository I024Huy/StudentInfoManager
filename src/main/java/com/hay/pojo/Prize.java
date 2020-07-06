package com.hay.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//获奖表
public class Prize {
    private Integer hid;
    private String name;
    private String level;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private Student student;

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
