require_relative "../test_helper"

class UserCanEditARobotTest < FeatureTest
  def create_robot
      RobotManager.create({
      :name => "Tortoise",
      :city => "Shell",
      :state => "DC",
      :avatar => "lean green slowalkin machine",
      :dob  => "1/3/1978",
      :date_hired => "5/7/2014",
      :department => "Greens"
      })
  end

  def test_user_can_edit
    create_robot
    visit '/'
    click_link_or_button("All Robots")
    click_link_or_button("Edit")
    fill_in("robot[name]", with: "Hare")
    click_link_or_button("submit")
    save_and_open_page
    assert_equal '/robots', current_path
    assert page.has_content?("Hare")
  end
end
