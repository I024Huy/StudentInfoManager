package com.hay.pojo;

//家庭信息表
public class Family {
    private Integer fid;
    private String flag;        //1:学生已编辑 0:学生未编辑
    private String address;
    private String fname;
    private String fgender;    //0:女；1:男
    private Integer fage;
    private String fphone;

    public Family() {
        super();
    }

    public Family(Integer fid, String address, String fname, String fgender, Integer fage, String fphone) {
        this.fid = fid;
        this.address = address;
        this.fname = fname;
        this.fgender = fgender;
        this.fage = fage;
        this.fphone = fphone;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFgender() {
        return fgender;
    }

    public void setFgender(String fgender) {
        this.fgender = fgender;
    }

    public Integer getFage() {
        return fage;
    }

    public void setFage(Integer fage) {
        this.fage = fage;
    }

    public String getFphone() {
        return fphone;
    }

    public void setFphone(String fphone) {
        this.fphone = fphone;
    }

    @Override
    public String toString() {
        return "Family{" +
                "fid=" + fid +
                ", address='" + address + '\'' +
                ", fname='" + fname + '\'' +
                ", fgender='" + fgender + '\'' +
                ", fage=" + fage +
                ", fphone='" + fphone + '\'' +
                '}';
    }
}
