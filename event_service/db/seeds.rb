Person.create(name: "Anto Dominic", date_of_birth: "10/11/1990") do |person|
  Event.create(message: "travelled to the hospital", created_at: Time.now, person: person)
  Event.create(message: "worked at alfreds for 8 hours", created_at: Time.now, person: person)
  Event.create(message: "went to pickup kids", created_at: Time.now, person: person)
end

Person.create(name: "Nurse Sam", date_of_birth: "1/01/1976") do |person|
  Event.create(message: "went to grocery shopping", created_at: Time.now, person: person)
  Event.create(message: "met with a client", created_at: Time.now, person: person)
  Event.create(message: "Slept all day", created_at: Time.now, person: person)
end