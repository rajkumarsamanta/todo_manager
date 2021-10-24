class User < ApplicationRecord
  has_secure_password
  has_many :todos

  #def to_displayable_string
  #  "#{id}. #{name} #{email.downcase} #{password}"
  #end

  # def self.to_displayable_list
  #   all.map { |user| user.to_displayable_string }
  # end

  # def self.show_list
  #   displayable_list = User.all.to_displayable_string
  #   puts displayable_list
  # end

  # def self.add_user(name, email, password)
  #   User.create!(name: name, email: email.downcase, password: password).id
  # end
end
