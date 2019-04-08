package cn.edu.hbpu.bookstore.pojo;

public class Delivery {
    private Integer asid;

    private Integer userid;

    private String address;

    private String postc;

    private String recname;

    private String phone;

    public Integer getAsid() {
        return asid;
    }

    public void setAsid(Integer asid) {
        this.asid = asid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPostc() {
        return postc;
    }

    public void setPostc(String postc) {
        this.postc = postc == null ? null : postc.trim();
    }

    public String getRecname() {
        return recname;
    }

    public void setRecname(String recname) {
        this.recname = recname == null ? null : recname.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}