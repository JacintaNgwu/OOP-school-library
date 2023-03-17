require_relative 'person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(age:, name:, parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
