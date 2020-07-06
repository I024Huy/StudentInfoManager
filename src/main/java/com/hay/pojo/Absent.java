package com.hay.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Absent {
    private Integer kid;
    private String course;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private String content;
    private Student student;

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
