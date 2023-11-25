package data.dao;

import data.dto.QuestionDto;
import data.dto.QuizDetailsDto;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class QuizDao {
    private Connection connection;
    public QuizDao(Connection connection) {
        this.connection = connection;
    }


    public ArrayList<QuizDetailsDto> getAllQuiz(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from quiz");
            ResultSet rs = ps.executeQuery();

            ArrayList<QuizDetailsDto> dtoList = new ArrayList<QuizDetailsDto>();

            while(rs.next()){
                dtoList.add(new QuizDetailsDto(rs.getString("id"),rs.getString("title"),rs.getLong("timeLimit")));
            }

            return dtoList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<QuestionDto> getQuizById(QuizDetailsDto dto){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from question where quiz_id = ?");
            ps.setString(1, dto.getQuizId());

            ResultSet rs = ps.executeQuery();
            ArrayList<QuestionDto> dtoList = new ArrayList<>();

            while(rs.next()){
                dtoList.add(new QuestionDto(rs.getString("id"),rs.getString("title"),rs.getString("option_1"),rs.getString("option_2"),rs.getString("option_3"),rs.getString("option_4"),rs.getInt("correct"),rs.getString("quiz_id")));
            }  

            return dtoList;       
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

   
}
