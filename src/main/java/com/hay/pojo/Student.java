package com.hay.pojo;

//学生表
public class Student implements java.io.Serializable{

	//序列化
	private static final long serialVersionUID = 1L;
	//学号
	private String sid;
	//姓名
	private String username;
	private String password;
	private String name;
	private String gender;
	private Integer age;
	private String phone;
	private String email;
	private String room;
	private String IDcard;
	private Integer grade;
	private String myclass;
	//家庭信息
	private Family family;
	//专业
	private Profession profession;
	//学院
	private College college;

	private Counselor counselor;
	
	/**
	 *	默认构造方法
	 * */
	public Student() {
		
	}

	@Override
	public String toString() {
		return "Student{" +
				"sid='" + sid + '\'' +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", gender='" + gender + '\'' +
				", age=" + age +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				", room='" + room + '\'' +
				", IDcard='" + IDcard + '\'' +
				", grade=" + grade +
				", myclass='" + myclass + '\'' +
				", family=" + family +
				", profession=" + profession +
				", college=" + college +
				'}';
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getMyclass() {
		return myclass;
	}

	public void setMyclass(String myclass) {
		this.myclass = myclass;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getIDcard() {
		return IDcard;
	}

	public void setIDcard(String IDcard) {
		this.IDcard = IDcard;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public Counselor getCounselor() {
		return counselor;
	}

	public void setCounselor(Counselor counselor) {
		this.counselor = counselor;
	}
}
