package Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private List<Students> studentsList;

    @Override
    public void init() throws ServletException{
        super.init();
        studentsList = new ArrayList<>();
        studentsList.add(new Students(1,"Ngocson","done",9.9));
        studentsList.add(new Students(2, "Ngocson2","pass",5.5));
        studentsList.add(new Students(3,"ngocson3","dup",3.3));

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        String action = request.getParameter("action");

        if(action == null){
            action = "list";
        }

        switch (action){
            case "new" :
                showNewForm(request, response);
                break;
            case "create" :
                createStudent(request, response);
                break;
            case "edit":
                editStudent(request, response);
                break;
            case "update":
                updateStudent(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
                break;
            default:
                listStudents(request,response);
                break;


        }
    }
            protected void  doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
                doGet(request,response);
            }
            protected void  listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
                request.setAttribute("studentsList", studentsList );
                RequestDispatcher dispatcher = request.getRequestDispatcher("student-list.jsp");
                dispatcher.forward(request,response);
            }

            private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

                RequestDispatcher dispatcher = request.getRequestDispatcher("student-form.jsp");
                dispatcher.forward(request,response);
            }

            private void  createStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

                    String studentName = request.getParameter("studentName");
                    String grade = request.getParameter("grade");

                    int id = studentsList.size()+1;

                    Double score = Double.parseDouble(request.getParameter("score"));

                    Students newStudent = new Students(id,studentName,grade,score);

                    studentsList.add(newStudent);

                    response.sendRedirect("students");

            }

            private void editStudent(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
                    int id = Integer.parseInt(request.getParameter("id"));

                    Students students = getStudentById(id);
                    request.setAttribute("students", students);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("student-form.jsp");
                    dispatcher.forward(request,response);
            }

            private  void  updateStudent(HttpServletRequest request, HttpServletResponse response) throws  ServletException , IOException {
                    int id = Integer.parseInt(request.getParameter("id"));

                    String studentName = request.getParameter("studentName");

                    String grade = request.getParameter("grade");

                    double score = Double.parseDouble(request.getParameter("score"));

                    Students students = getStudentById(id);
                    students.setStudentName(studentName);
                    students.setGrade(grade);
                    students.setScore(score);

                    response.sendRedirect("students");


            }

            private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
                int id = Integer.parseInt(request.getParameter("id"));

                Students students = getStudentById(id);
                studentsList.remove(students);

                response.sendRedirect("students");

            }

            private Students getStudentById( int id) throws ServletException, IOException {
                    for (Students students : studentsList)
                    {
                        if (students.getId() == id)
                        {
                            return students;
                        }
                    }
                    return  null;
            }
}
