require_relative "../test_helper"

class UserCreateRobotTest < FeatureTest

  def test_user_can_create_new_robot
    visit '/'
    click_link_or_button("Add a New Robot")
    fill_in("robot[name]", with: "Tortoise")
    fill_in("robot[city]", with: "SouthBend")
    fill_in("robot[state]", with: "IN")
    fill_in("robot[avatar]", with: "Tallish funnylookin Glasses")
    fill_in("robot[dob]", with: "07/03/1987")
    fill_in("robot[date_hired]", with: "09/10/2012")
    fill_in("robot[department]", with: "GRRRR8")
    click_link_or_button("Create Robot")
    assert_equal "/robots", current_path
    assert page.has_content?("Tortoise")
    save_and_open_page
  end

end
