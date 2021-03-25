package jsp.member.model;

import java.sql.Timestamp;


/**
 * 데이터의 전달을 담당하는 클래스 - DTO
 *<pre>
 * String member_id;	// 아이디
 * String password;		// 비밀번호
 * String name;			// 이름
 * String gender;		// 성별
 * String birthyy;		// 생일 - 년
 * String birthmm;		// 생일 - 월
 * String birthdd;		// 생일 - 일
 * String mail1;		// 이메일 - @ 앞부분
 * String mail2;		// 이메일 - @ 뒷부분
 * String phone;		// 전화
 * String address;		// 주소
 * Timestamp reg;		// 가입일
 *</pre>
 */
public class MemberBean 
{
	private String member_id;	// 아이디
	private String password; 	// 비밀번호
	private String member_name;		// 이름
	private String gender;		// 성별
	private String birthyy;		// 생일 - 년
	private String birthmm;		// 생일 - 월
	private String birthdd;		// 생일 - 일
	private String mail1;		// 이메일 - @ 앞부분
	private String mail2;		// 이메일 - @ 뒷부분
	private String phone;		// 전화
	private String address;		// 주소
	private Timestamp reg;		// 가입일
	
	public String getMember_id() {return member_id;}
	public void setMember_id(String member_id) {this.member_id = member_id;}
	
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	
	public String getMember_name() {return member_name;}
	public void setMember_name(String member_name) {this.member_name = member_name;}
	
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}
	
	public String getBirthyy() {return birthyy;}
	public void setBirthyy(String birthyy) {this.birthyy = birthyy;}
	public String getBirthmm() {return birthmm;}
	public void setBirthmm(String birthmm) {this.birthmm = birthmm;}
	public String getBirthdd() {return birthdd;}
	public void setBirthdd(String birthdd) {this.birthdd = birthdd;}
	
	public String getMail1() {return mail1;}
	public void setMail1(String mail1) {this.mail1 = mail1;}
	public String getMail2() {return mail2;}
	public void setMail2(String mail2) {this.mail2 = mail2;}
	
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	
	public Timestamp getReg() {return reg;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}