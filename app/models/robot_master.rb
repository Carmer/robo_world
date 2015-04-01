require 'YAML/store'
require_relative "robot"

class RobotMaster

  def self.create(robot)
    robo_database.transaction do
      robo_database['robots'] ||= []
      robo_database['total']  ||= 0
      robo_database['total']  += 1
      robo_database['robots'] << {"id" => robo_database['total'],"name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => robot[:avatar], "birthdate" => robot[:dob], "date_hired" => robot[:date_hired], "department" => robot[:department] }
   end
  end

  def self.robot_info(id)
    robots_info.find { |robot| robot.["id"] == id }
  end

  def self.find(id)
    Robot.new(robot_info(id))
  end

  def self.robo_database
    @robo_database ||= YAML::Store.new("db/robo_master")
  end

  def self.robots_info
    robo_database.transaction do
      robo_database['robots'] || []
    end
  end

  def self.all
    robots_info.map { |info| Robot.new(info) }
  end
end
