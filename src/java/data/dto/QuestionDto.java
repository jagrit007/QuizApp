package data.dto;

public class QuestionDto {

  private String questionId;
  private String questionTitle;
  private String option1;
  private String option2;
  private String option3;
  private String option4;
  private int correctOption;
  private String quizId;

  public QuestionDto(String questionId, String questionTitle, String option1, String option2, String option3, String option4,int correctOption, String quizId) {
    this.quizId = quizId;
    this.questionId = questionId;
    this.questionTitle = questionTitle;
    this.option1 = option1;
    this.option2 = option2;
    this.option3 = option3;
    this.option4 = option4;
    this.correctOption = correctOption;
  }

  public String getQuizId() {
    return quizId;
  }

  public String getQuestionId() {
    return questionId;
  }

  public String getQuestionTitle() {
    return questionTitle;
  }

  public String[] getOption() {
    return new String[] {option1, option2, option3, option4};
  }

  public int getCorrectOption() {
    return correctOption;
  }

  
}
