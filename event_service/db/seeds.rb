Person.create(name: "Anto", date_of_birth: "10/11/1990") do |person|
  Event.create(message: "Hello", created_at: Time.now, person: person)
  Event.create(message: "Hello Anto", created_at: Time.now, person: person)
end