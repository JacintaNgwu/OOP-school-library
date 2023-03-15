require_relative 'student_class'

class Classroom
    attr_accessor :label, :students

    def initialize(label)
        @label = label
        @students = []
    end

    def add_student(student)
        @students << student
        @students = []
    end

    def add_student(student)
        @students << student
        student.classroom = self
    end
end

classroom = Classroom.new("class 1")
student = Student.new(name: "John", age: 15, classroom: classroom, parent_permission: true)
classroom.add_student(student)
puts classroom.student.label # => "class 1"