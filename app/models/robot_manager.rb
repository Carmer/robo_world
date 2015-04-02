require 'YAML/store'

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
    if ENV["ROBOT_MANAGER_ENV"] == 'test'
      @robo_database ||= YAML::Store.new("db/robot_manager_test")
    else
      @robo_database ||= YAML::Store.new("db/robot_manager")
    end
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

  def self.destroy(id)
    robo_database.transaction do
      target = robo_database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    robo_database.transaction do
      robo_database['robots'] = []
      robo_database['total'] = 0
    end
  end
end
