require 'YAML/store'
require_relative "robot"

class RobotManager

  def self.create(robot)
    robo_database.transaction do
      robo_database['robots'] ||= []
      robo_database['total']  ||= 0
      robo_database['total']  += 1
      robo_database['robots'] << {"id" => robo_database['total'],"name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => robot[:avatar], "birthdate" => robot[:dob], "date_hired" => robot[:date_hired], "department" => robot[:department] }
   end
  end

  def self.robot_info(id)
    robots_info.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(robot_info(id))
  end

  def self.robo_database
    @robo_database ||= YAML::Store.new("db/robo_manager")
  end

  def self.robots_info
    robo_database.transaction do
      robo_database['robots'] || []
    end
  end

  def self.all
    robots_info.map { |info| Robot.new(info) }
  end

  def self.update(id, robot)
    robo_database.transaction do
      to_change = robo_database['robots'].find { |robot| robot["id"] == id }
      to_change["name"] = robot[:name]
      to_change["city"] = robot[:city]
      to_change["state"] = robot[:state]
      to_change["avatar"] = robot[:avatar]
      to_change["birthday"] = robot[:dob]
      to_change["date_hired"] = robot[:date_hired]
      to_change["department"] =  robot[:department]
    end
  end
end
