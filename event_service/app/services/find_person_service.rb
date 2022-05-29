class FindPersonService
  attr_accessor :name, :date_of_birth, :person

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  def process
    return unless name
    return unless date_of_birth

    @person = Person.where(name: name, date_of_birth: { :$gte => date_of_birth }).first
  end

  def events
    return unless person

    person.events
  end

end