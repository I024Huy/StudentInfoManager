package com.hay.pojo;

//专业表
public class Profession {
    private Integer zid;
    private String name;
    //学院
    private College college;

    public Integer getZid() {
        return zid;
    }

    public void setZid(Integer zid) {
        this.zid = zid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    @Override
    public String toString() {
        return "Profession{" +
                "zid=" + zid +
                ", name='" + name + '\'' +
                ", college=" + college +
                '}';
    }
}
