require "active_record"
require "./user.rb"

def connect_db!
  ActiveRecord::Base.establish_connection(
    host: "localhost",
    adapter: "postgresql",
    database: "saas_db",
    user: "postgres",
    password: "Khadku",
  )
end

connect_db!

ActiveRecord::Migration.create_table(:users) do |t|
  t.column :name, :text
  t.column :email, :text
  t.column :password, :text
end

# User.create!(name: "Raj Kumar", email: "some@xyz.com", password: "Some-xyzcom")
# User.create!(name: "Vivek Kumar", email: "vivek@xyz.com", password: "Vivek-xyzcom")
# User.create!(name: "Bikash Sharma", email: "bikash@sharma.com", password: "Bikash-sharma")
