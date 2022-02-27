/* To create Database */
use Edtech
/* To insert into course using insert */
db.course.insert(
    {
        course_name: "C++",
        course_desc : "C++ Programming Course",
        course_startdate: new Date(2022-03-01),
        course_duration : "6 months",
        course_trainer: "Ram Krishna",
        student : [ObjectId("621b775b90b81a0d17fe6761")]
    }
)
/* To insert into course using insertMany */
db.course.insertMany([
    {
        course_name: "JAVA",
        course_desc : "JAVA Programming Course",
        course_startdate: new Date(2022-03-01),
        course_duration : "4 months",
        course_trainer: "Kishore Kumar",
        student : [ObjectId("621b7f0b90b81a0d17fe6765"),ObjectId("621b7f0b90b81a0d17fe6767"),ObjectId("621b7f0b90b81a0d17fe6768")]
    },
    {
        course_name: "PYTHON",
        course_desc : "PYTHON Programming Course",
        course_startdate: new Date(2022-03-15),
        course_duration : "6 months",
        course_trainer: "Gagandeep Singh",
        student : [ObjectId("621b7f0b90b81a0d17fe6766"),ObjectId("621b7f0b90b81a0d17fe6767")]
    },
    {
        course_name: "C",
        course_desc : "C Programming Course",
        course_startdate: new Date(2022-03-15),
        course_duration : "6 months",
        course_trainer: "Geet Kiran Kaur",
        student : [ObjectId("621b7f0b90b81a0d17fe6767"),ObjectId("621b7f0b90b81a0d17fe6765")]
    },
    {
        course_name: "Machine Learning",
        course_desc : "ML Course",
        course_startdate: new Date(2022-04-01),
        course_duration : "3 months",
        course_trainer: "Surender Sarkar",
        student : [ObjectId("621b7f0b90b81a0d17fe6766"),ObjectId("621b7f0b90b81a0d17fe6768")]
    }
])
/* To insert into student using insert */
db.student.insert(
    {
        student_name: "Harish Kumar",
        student_email: "chintha@gmail.com",
        student_number: 9030643343,
        student_age: 22,
        student_joined_date: Date()
    }
)
/* To insert into student using insertMany */
db.student.insertMany([
    {
        student_name: "Kalayan Peddakota",
        student_email: "kalyan.peddakota@gmail.com",
        student_number: 9302766363,
        student_age: 20,
        student_joined_date: Date()
    },
    {
        student_name: "Saahil Qurishi",
        student_email: "saahil.qurishi@gmail.com",
        student_number: 9302764534,
        student_age: 22,
        student_joined_date: Date()
    },
    {
        student_name: "Samara Simhareddy",
        student_email: "sam.gorla@gmail.com",
        student_number: 9456323363,
        student_age: 21,
        student_joined_date: Date()
    },
    {
        student_name: "Rithvik Bhadri",
        student_email: "rithvik.badri@gmail.com",
        student_number: 8179374530,
        student_age: 23,
        student_joined_date: Date()
    }
])
/* To update data in student using update and updateMany */    
db.student.update(
      { student_name: "Harish Kumar" },
      { $set: { courses : [ObjectId("621b789c90b81a0d17fe6762")]} }
   )

db.student.updateMany(
      { student_name: "Samara Simhareddy"},
      { $set: {courses : [ObjectId("621b827190b81a0d17fe6769"),ObjectId("621b827190b81a0d17fe676a"),ObjectId("621b827190b81a0d17fe676b")]
              }
      }
)
db.student.update(
      { student_name: "Rithvik Bhadri" },
      { $set: { courses : [ObjectId("621b827190b81a0d17fe676c"),ObjectId("621b827190b81a0d17fe6769")] } }
)
db.student.update(
      { student_name: "Kalayan Peddakota" },
      { $set: { courses : [ObjectId("621b827190b81a0d17fe6769"),ObjectId("621b827190b81a0d17fe676b")] } }
)
db.student.update(
      { student_name: "Saahil Qurishi" },
      { $set: { courses : [ObjectId("621b827190b81a0d17fe676a"),ObjectId("621b827190b81a0d17fe676c")] } }
)

/* Updating the session details into course collection using update */
      
db.course.update(
      { course_name: "C++" },
      { $set: { session : {session_timing : "9:30 AM to 10:30 AM",session_desc: "Monday to Friday",session_link: "https://cuchd-in.zoom.us/j/95309898546"}}}
)    
db.course.update(
      { course_name: "C" },
      { $set: { session : {session_timing : "11:00 AM to 12:00 PM",session_desc: "Monday to Friday",session_link: "https://cuchd-in.zoom.us/j/91430002433"}}}
)    
db.course.update(
      { course_name: "PYTHON" },
      { $set: { session : {session_timing : "1:00 PM to 2:00 PM",session_desc: "Monday to Friday",session_link: "https://cuchd-in.zoom.us/j/92306556409"}}}
)
db.course.update(
      { course_name: "JAVA" },
      { $set: { session : {session_timing : "2:30 PM to 3:30 PM",session_desc: "Monday to Friday",session_link: "https://cuchd-in.zoom.us/j/95771308884"}}}
)
db.course.update(
      { course_name: "Machine Learning" },
      { $set: { session : {session_timing : "4:00 PM to 5:00 PM",session_desc: "Monday to Friday",session_link: "https://cuchd-in.zoom.us/j/91607643289"}}}
)
      
/* To insert documents into assessment collection */
      
db.assessments.insertMany([
    {
        subject : "C",
        project_title : "Snake Game",
        project_desc: "This is a simple snake game. GOTO function is used for movements of a snake. ⬆,➡,⬇,⬅ arrows used to control the snake. You can save gaming score with file handling concept."
    },
    {
        subject: "C",
        project_title: "Contact Management System",
        project_desc: "In this C project, users can save the contact and can also edit and delete it. Its like a phone book application. File handling is used to store the data. It also uses data structure to save the contacts etc."
    },
    {
        subject: "C",
        project_title: "Cricket score display",
        project_desc: "It consists of the runs made by batsman, wickets and number of balls played which will display on the screen. Along with this, it also displays the name of the batsman and bowler. It also displays the date and time of the game."
    },
    {
        subject: "C++",
        project_title: "Employee management system",
        project_desc: "This beginner C++ project is helpful for the small scale and large scale industries. Admin can add all details about the employee and can update and delete it. File handling is used to store the data of employees."
    },
    {
        subject: "C++",
        project_title: "Pacman Game",
        project_desc: "The Pacman game is similar to the snake game. It is a simple game without graphics for entertainment purposes. Source code is written in the C programming language and it is very easy to understand."
    },
    {
        subject: "PYTHON",
        project_title: "Quiz game",
        project_desc: "It consists of simple MCQ based on sports, general knowledge, technical content etc. Players just have to select the correct answer and can reach the next level. It is a very simple project with error-free sources."
    },
    {
        subject: "JAVA",
        project_title: "Payment Billing Product Project",
        project_desc: "Technologies to use JSP, Javascript, Ajax"
    },
    {
        subject: "Machine Learning",
        project_title: "Loan Prediction using Machine Learning",
        project_desc: "The idea behind this ML project is to build a model that will classify how much loan the user can take. It is based on the user’s marital status, education, number of dependents, and employments. You can build a linear model for this project."
    }
])

/* Updating the assessment details into course collection using update */
    
db.course.update(
      { course_name: "C" },
      { $set: {assessments : [ObjectId("621bc01c90b81a0d17fe676d"),ObjectId("621bc01c90b81a0d17fe676e"),ObjectId("621bc01c90b81a0d17fe676f")]}}
)
db.course.update(
      { course_name: "C++" },
      { $set: {assessments : [ObjectId("621bc01c90b81a0d17fe6770"),ObjectId("621bc01c90b81a0d17fe6771")]}}
)
db.course.update(
      { course_name: "PYTHON" },
      { $set: {assessments : [ObjectId("621bc01c90b81a0d17fe6772")]}}
)
db.course.update(
      { course_name: "JAVA" },
      { $set: {assessments : [ObjectId("621bc01c90b81a0d17fe6773")]}}
)
db.course.update(
      { course_name: "Machine Learning" },
      { $set: {assessments : [ObjectId("621bc01c90b81a0d17fe6774")]}}
)
