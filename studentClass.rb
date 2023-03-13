require_relative 'person'
class Student < Person
    def initialize(age: 0, classroom:, name: 'Unknown', parent_permission: true)
        super(age: age, name: name, parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end