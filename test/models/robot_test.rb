require_relative '../test_helper'

class RobotTest < ModelTest

  def create_robots(num)
    num.times do |x|
    RobotManager.create({
      name: "name#{x}",
      city: "city#{x}",
      state: "state#{x}",
      avatar: "avatar#{x}",
      birthday: "birthday#{x}",
      date_hired: "hired#{x}",
      department: "department#{x}"
      })
    end
  end

  def test_it_can_find_all_robots
    create_robots(10)
    robots = RobotManager.all
    assert_equal 10, robots.size
  end

  def test_it_can_find_a_specific_robot_by_id
    create_robots(8)
    robot1 = RobotManager.find(1)
    robot7 = RobotManager.find(7)
    assert_equal "name0", robot1.name
    assert_equal "department6", robot7.department
  end

  def test_it_can_delete_a_robot
    create_robots(3)
    robots1 = RobotManager.all
    assert_equal 3, robots1.size
    RobotManager.destroy(2)
    robots2 = RobotManager.all
    assert_equal 2, robots2.size
  end
end
