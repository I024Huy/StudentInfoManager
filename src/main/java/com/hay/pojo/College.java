package com.hay.pojo;

//学院表
public class College {
    private Integer xid;
    private String name;


    public Integer getXid() {
        return xid;
    }

    public void setXid(Integer xid) {
        this.xid = xid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "College{" +
                "xid=" + xid +
                ", name='" + name + '\'' +
                '}';
    }
}
