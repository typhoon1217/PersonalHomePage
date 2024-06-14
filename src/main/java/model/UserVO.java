package model;

public class UserVO {
    private String username;
    private String pw;
    private String email;
    private String name;
    private String gender;
    private String phone1;
    private String phone2;
    private String zipcode;
    private String address1;
    private String address2;
    private String role;
    
	public UserVO() {
		super();
	}

	public UserVO(String username, String pw, String email, String name, String gender, String phone1, String phone2,
			String zipcode, String address1, String address2, String role) {
		super();
		this.username = username;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.gender = gender;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}
    
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}

