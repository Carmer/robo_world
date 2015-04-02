require_relative "../test_helper"

class UserCreateRobotTest < FeatureTest

  def test_user_can_create_new_robot
    #user visits dashboard
    visit '/'
    #and clicks the "Add a New Robot" link
    click_link_or_button("Add a New Robot")
    #and fills in the name form
    fill_in("robot[name]", with: "Andrew")
    #and fills in the city form
    fill_in("robot[city]", with: "SouthBend")
    #and fills in the state form
    fill_in("robot[state]", with: "IN")
    #and fills in the avatar form
    fill_in("robot[avatar]", with: "Tallish funnylookin Glasses")
    #and fills in the birthday form
    fill_in("robot[dob]", with: "07/03/1987")
    #and fills in the date_hired form
    fill_in("robot[date_hired]", with: "09/10/2012")
    #and fills in the department form
    fill_in("robot[department]", with: "GRRRR8")
    #and the user clicks submit
    click_link_or_button("Create Robot")
    #then i expect to see the robot list
    assert_equal "/robots", current_path
    save_and_open_page
    #and the page should display new robots name
    assert page.has_content?("Andrew")
  end

end
