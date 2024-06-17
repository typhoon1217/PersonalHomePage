package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import model.UserVO;
import model.ZipCodeVO;

public class UserDAO {

	// user dup check
	public boolean usernameCheck(String username) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select * from users where USER_USERNAME = ?");
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (!rs.next())
				result = false;
			System.out.println("중복 유저명");
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.err.println("UserDAO userCheck ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return result;
	}

	public List<UserVO> getAllUserNamesAndRoles() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UserVO> userList = new ArrayList<>();

		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("SELECT USER_USERNAME, USER_ROLE FROM USERS");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserVO user = new UserVO();
				user.setUsername(rs.getString("USER_USERNAME"));
				user.setRole(rs.getString("USER_ROLE"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("UserDAO getAllUserNamesAndRoles ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}

		return userList;
	}

	public Vector<ZipCodeVO> zipcodeRead(String dong) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setBunji(rs.getString("bunji"));
				vecList.addElement(tempZipcode);
			}
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.err.println("UserDAO userCheck ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return vecList;
	}

	public String getRole(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String role = "";
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_ROLE from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				role = rs.getString("USER_ROLE");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		System.out.println("role:" + role);
		return role;
	}

	public String getTheme(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String theme = "";
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_THEME from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				theme = rs.getString("USER_THEME");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		System.out.println("theme:" + theme);
		return theme;
	}

	public String getThemeMode(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String theme = "";
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_MODE from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				theme = rs.getString("USER_MODE");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		System.out.println("USER_MODE:" + theme);
		return theme;
	}

	public String getUserpic(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String theme = "";
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_PICTURE from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				theme = rs.getString("USER_PICTURE");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		System.out.println("USER_PICTURE:" + theme);
		return theme;
	}

	public String getwallpaper(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String theme = "";
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_WALLPAPER from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				theme = rs.getString("USER_WALLPAPER");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		System.out.println("USER_WALLPAPER:" + theme);
		return theme;
	}

	// email dup check
	public boolean emailCheck(String email) {

		System.out.println("emailchk2:" + email); // 넘어옴
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select * from users where USER_EMAIL = ?");
			pstmt.setString(1, email);
			System.out.println("emailchk3:" + pstmt);
			rs = pstmt.executeQuery();
			if (!rs.next())
				result = false;
			System.out.println("dup email");
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.err.println("UserDAO emailCheck ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return result;
	}

	public boolean userInsert(UserVO uvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			conn = DBPoolUtil.makeConnection();

			String strQuery1 = "INSERT INTO USERS (USER_USERNAME, USER_PW, USER_EMAIL, USER_NAME, USER_GENDER, USER_PHONE1, USER_PHONE2, USER_ZIPCODE, USER_ADDRESS1, USER_ADDRESS2, USER_ROLE, USER_THEME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'guest', 'default_theme')";
			pstmt = conn.prepareStatement(strQuery1);
			pstmt.setString(1, uvo.getUsername());
			pstmt.setString(2, uvo.getPw());
			pstmt.setString(3, uvo.getEmail());
			pstmt.setString(4, uvo.getName());
			pstmt.setString(5, uvo.getGender());
			pstmt.setString(6, uvo.getPhone1());
			pstmt.setString(7, uvo.getPhone2());
			pstmt.setString(8, uvo.getZipcode());
			pstmt.setString(9, uvo.getAddress1());
			pstmt.setString(10, uvo.getAddress2());
			// pstmt.setString(11, "Guest"); // This line is not needed since 'Guest' is
			// hardcoded in the query

			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception ex) {
			System.out.println("Exception: " + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return flag;
	}

//	public String loadRole (String id) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int check = -1;
//		try {
//			conn = DBPoolUtil.makeConnection();
//			String strQuery = "select pass from USERS where id = ?";
//			pstmt = conn.prepareStatement(strQuery);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				String dbPass = rs.getString("pass");
//				if (pass.equals(dbPass))
//					check = 1;
//				else
//					check = 0;
//			}
//		} catch (Exception ex) {
//			System.out.println("Exception" + ex);
//		} finally {
//			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
//		}
//		return check;
//	}

	// 로그인 체크 입력기능(세션등록 인증기능)
	public int loginCheck(String username, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn = DBPoolUtil.makeConnection();
			String strQuery = "select USER_PW from USERS where USER_USERNAME = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("USER_PW");
				if (pw.equals(dbPass)) {
					check = 1;
					System.out.println("Login V");
				} else
					check = 0;
				System.out.println("Login F");
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return check;
	}

	public UserVO getMember(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO vo = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select * from USERS where user_username = ?");
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {// 해당 아이디에 대한 회원이 존재
				vo = new UserVO();
				vo.setUsername(rs.getString("USER_USERNAME"));
				vo.setEmail(rs.getString("USER_EMAIL"));
				vo.setName(rs.getString("USER_NAME"));

				vo.setGender(rs.getString("USER_GENDER"));
				vo.setPhone1(rs.getString("USER_PHONE1"));
				vo.setPhone2(rs.getString("USER_PHONE2"));
				vo.setZipcode(rs.getString("USER_ZIPCODE"));

				vo.setAddress1(rs.getString("USER_ADDRESS1"));
				vo.setAddress2(rs.getString("USER_ADDRESS2"));
				vo.setRole(rs.getString("USER_ROLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("UserDAO getMember ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return vo;
	}

	public void updateMember(UserVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("update users set pw=?, name=?, email=? where username=?");
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getUsername());
			// System.out.println(vo.getPw()+vo.getName()+vo.getEmail()+vo.getUsername());
			pstmt.executeUpdate();

			System.out.println("UserDAO updateMember pass");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("UserDAO updateMember ERROR");
		} finally {
			DBPoolUtil.dbReleaseClose(pstmt, conn);
		}
	}

	public int deleteMember(String username, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = ""; // 데이터베이스에 실제 저장된 패스워드
		int result = -1; // 결과치

		try {
			System.out.println("Username: " + username + " | Password: " + pw);
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("SELECT pw FROM users WHERE username = ?");
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPass = rs.getString("pw");
				System.out.println("Database Password: " + dbPass);
				if (dbPass.equals(pw)) { // true - 본인 확인
					// Start transaction
					conn.setAutoCommit(false);

					// Delete roles associated with the user
					pstmt.close(); // Close previous PreparedStatement
					pstmt = conn.prepareStatement("DELETE FROM role WHERE username = ?");
					pstmt.setString(1, username);
					int rowsAffected = pstmt.executeUpdate();
					System.out.println("Deleted roles: " + rowsAffected);

					// Delete the user
					pstmt.close(); // Close previous PreparedStatement
					pstmt = conn.prepareStatement("DELETE FROM users WHERE username = ?");
					pstmt.setString(1, username);
					rowsAffected = pstmt.executeUpdate();
					System.out.println("Deleted user: " + rowsAffected);

					// Commit transaction
					conn.commit();
					System.out.println("Passed and commit");
					result = 1; // 회원탈퇴 성공
				} else { // 본인확인 실패 - 비밀번호 오류
					System.out.println("Password mismatch");
					result = 0;
				}
			} else {
				System.out.println("Username not found");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("UserDAO deleteMember ERROR");
			try {
				if (conn != null) {
					conn.rollback(); // Rollback transaction on error
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		} finally {
			DBPoolUtil.dbReleaseClose(rs, pstmt, conn);
		}
		return result;
	}
}