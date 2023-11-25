package data.dao;

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

    public boolean signup(UserSignupDto dto) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into quiz_user values(?, ?, ?, ?)");
            ps.setString(1, UUID.randomUUID().toString());
            ps.setString(2, dto.getName());
            ps.setString(3, dto.getEmail());
            ps.setString(4, hashPassword(dto.getPassword()));
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String login(UserLoginDto dto) {
        try {
            PreparedStatement ps = connection.prepareStatement("select id from quiz_user where email = ? AND password = ?");
            ps.setString(1, dto.getEmail());
            ps.setString(2, hashPassword(dto.getPassword()));
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getString("id");
            } else return null;
        } catch (SQLException e) {
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
