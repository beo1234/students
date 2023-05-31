package Student;

public class Students {
    private Integer id;
    private String studentName;
    private String grade;
    private Double score;




    public Students(Integer id, String studentName, String grade,  Double score){
        this.id = id;
        this.studentName = studentName;
        this.grade = grade;
        this.score = score;


    }

    public String getStudentName() {return studentName;}

    public void setStudentName(String studentName) { this.studentName = studentName;}

    public Integer getId() {return id;}

    public void setId(Integer id) {this.id = id;}

    public String getGrade() {return grade;}

    public void setGrade(String grade) {this.grade = grade;}

    public Double getScore() {return score;}

    public void setScore(Double score) {this.score = score;}


}

