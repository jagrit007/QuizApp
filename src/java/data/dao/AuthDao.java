package data.dao;

import data.dto.User;
import data.dto.UserLoginDto;
import data.dto.UserSignupDto;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.UUID;

public class AuthDao {
    private Connection connection;
    public AuthDao(Connection connection) {
        this.connection = connection;
    }

    public User register(UserSignupDto dto) {
        try {
            String uid = UUID.randomUUID().toString();
            PreparedStatement ps = connection.prepareStatement("insert into quiz_user values(?, ?, ?, ?)");
            ps.setString(1, uid);
            ps.setString(2, dto.getName());
            ps.setString(3, dto.getEmail());
            ps.setString(4, hashPassword(dto.getPassword()));
            if(ps.executeUpdate() > 0) {
                return new User(uid, dto.getName(), dto.getEmail());
            } else return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User login(UserLoginDto dto) {
        try {
            PreparedStatement ps = connection.prepareStatement("select * from quiz_user where email = ? AND password = ?");
            ps.setString(1, dto.getEmail());
            ps.setString(2, hashPassword(dto.getPassword()));
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                System.out.println("login success");
                return new User(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("email")
                );
            } else {
                System.out.println("login wrong");
                return null;
            }
        } catch (SQLException e) {
            System.out.println("login failed");
            e.printStackTrace();
            return null;
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] hashedPassword = md.digest();

            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
