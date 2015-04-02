require_relative "../test_helper"

class UserSeesAllRobotsTest < FeatureTest
  def create_robot
    RobotManager.create({
      name: "Tortoise",
      city: "Shell",
      state: "DC",
      avatar: "lean green slowalkin machine",
      dob: "1/3/1978",
      date_hired: "5/7/2014",
      department: "Greens"
      })
  end

  def test_user_can_see_list_of_all_robots
    create_robot
    visit '/'
    click_link_or_button("All Robots Registered with RoboWorld")
    assert_equal '/robots', current_path
    assert page.has_content?("Tortoise")
  end
end
