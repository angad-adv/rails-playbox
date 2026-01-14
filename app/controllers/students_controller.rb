class StudentsController < ApplicationController
    skip_before_action :authenticate_request
    def stuff
        # students = Student.where("age > ?", 21)
        # student = Student.find_by(email: "aman@gmail.com")
        # students = Student.where("age > ?", 21).pluck(:name)
        # total = Student.count
        # return render json: {
        #     students: students,
        #     total: total
        # }

        # courses = Student.find_by(name: "Aman").courses

        # return render json:{
        #     courses: courses
        # }

        # students = Course.find_by(code: "ROR101").students
        # return render json: students

        # grades = Student.find_by(name: "Aman").enrollments.joins(:course).pluck("courses.title", "enrollments.grade")
        # return render json: grades

        # students = Student.joins(:courses).where(courses: { code: "DB301" })
        # return render json: students

        # students = Student.order(created_at: :desc, age: :desc)
        # return render json: students

        begin
            students = Student.all
            return render json: students[0].courses
        rescue => e
            render json: { error: e.message }, status: :internal_server_error
        end          
        
        #  🟣 ADVANCED / REAL WORLD TASKS

        # 15️⃣ Get students who have A grade in any course

        # 16️⃣ Get students who are enrolled in at least 2 courses

        # 17️⃣ Get courses with average grade = A (hint: map grades to numbers)

        # 18️⃣ Find students NOT enrolled in any course

        # 19️⃣ Enroll a student safely (avoid duplicates)

        # 20️⃣ Write a service that enrolls a student + validates age > 18
    end
end
