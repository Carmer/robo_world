require_relative "../test_helper"

class UserCanLookAtARobotTest < FeatureTest
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

  def test_user_look_at_specific_robot
    create_robot
    visit '/'
    click_link_or_button("All Robots Registered with RoboWorld")
    save_and_open_page
    click_link_or_button("1: Tortoise")
    assert_equal '/robots/1', current_path
    assert page.has_content?("Tortoise")
  end
end
