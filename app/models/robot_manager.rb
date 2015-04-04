require 'YAML/store'
require 'faker'
require 'sequel'
require 'sqlite3'

class RobotManager

  def self.create(robot)
    data = {
      :name => robot[:name],
      :city => robot[:city],
      :state => robot[:state],
      :avatar => robot[:avatar],
      :dob =>robot[:dob],
      :date_hired => robot[:date_hired],
      :department => robot[:department]
    }

    robo_database.from(:robots).insert(data)
 end

  def self.create_random(num = 1)
    num[:number].to_i.times do
      random
    end
  end

  def self.random
  data = {
        :name => Faker::Name.name,
        :city => Faker::Address.city,
        :state => Faker::Address.state_abbr,
        :avatar => Faker::Lorem.sentence,
        :dob => Faker::Date.backward(99),
        :date_hired => Faker::Date.backward(12),
        :department => Faker::Lorem.sentence
        }

      robo_database.from(:robots).insert(data)
  end

  def self.robot_info(id)
    robo_database.from(:robots).where(:id => id).to_a.first
    # robots_info.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(robot_info(id))
  end

  def self.robo_database
    if ENV["ROBOT_MANAGER_ENV"] == 'test'
      @robo_database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @robo_database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  # def self.robots_info
  #   robo_database.transaction do
  #     robo_database['robots'] || []
  #   end
  # end

  def self.all
    data = robo_database.from(:robots).to_a
    data.map { |info| Robot.new(info) }
  end

  def self.update(id, robot)
    robo_database.from(:robots).where(:id => id).update(
    :name => robot[:name],
    :city => robot[:city],
    :state => robot[:state],
    :avatar => robot[:avatar],
    :dob => robot[:dob],
    :date_hired => robot[:date_hired],
    :department => robot[:department]
    )
    # robo_database.transaction do
    #   to_change = robo_database['robots'].find { |robot| robot["id"] == id }
    #   to_change["name"] = robot[:name]
    #   to_change["city"] = robot[:city]
    #   to_change["state"] = robot[:state]
    #   to_change["avatar"] = robot[:avatar]
    #   to_change["birthday"] = robot[:dob]
    #   to_change["date_hired"] = robot[:date_hired]
    #   to_change["department"] =  robot[:department]
    # end
  end

  def self.destroy(id)
    robo_database.from(:robots).where(:id => id).delete
  end

  def self.delete_all
    robo_database.from(:robots).delete
  end

end
