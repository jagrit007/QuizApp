package data.dto;

public class QuizDetailsDto {

  private String quizId;
  private String qTitle;
  private long timeLimit;

  public QuizDetailsDto(String quizId, String qTitle, long timeLimit) {
    this.quizId = quizId;
    this.qTitle = qTitle;
    this.timeLimit = timeLimit;
  }

  public String getQuizId() {
    return quizId;
  }

  public String getQuizTitle() {
    return qTitle;
  }

  public String getTimeLimit() {
    return timeLimit;
  }
}
