require_relative 'person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, age: 0, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end