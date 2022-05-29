class FindPersonService
  attr_accessor :name, :date_of_birth, :person

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  def process
    return unless name
    return unless date_of_birth

    @person = Person.find_by("CONCAT(first_name, ' ', last_name) = ? AND date_of_birth = ?", name, date_of_birth)
  end
end
