class Person < ApplicationRecord
  scope :search_by_name, ->(query) do
    where("CONCAT_WS(' ', first_name, last_name) LIKE ?", "%#{query}%").first
  end

  def name
    "#{first_name} #{last_name}"
  end
end
