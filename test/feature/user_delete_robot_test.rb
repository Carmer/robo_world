require_relative "../test_helper"

class UserCanDeleteARobotTest < FeatureTest
  def create_robot
    RobotManager.create({
      "name" => "Tortoise",
      "city" => "Shell",
      "state" => "DC",
      "avatar" => "lean green slowalkin machine",
      "dob"  => "1/3/1978",
      "date_hired" => "5/7/2014",
      "department" => "Greens"
      })
  end

  def test_user_can_delete_a_robot
    create_robot
    visit '/'
    click_link_or_button("All Robots")
    click_link_or_button("delete robot")
    save_and_open_page
    refute page.has_content?("Tortoise")
    assert_equal '/robots', current_path
  end
end
