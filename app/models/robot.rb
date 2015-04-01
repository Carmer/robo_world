class Robot
  attr_reader :name, :id, :avatar, :city, :state, :birthday, :date_hired, :department

  def initialize(info)
    @id = info["id"]
    @name = info["name"]
    @city = info["city"]
    @state = info["state"]
    @avatar = info["avatar"]
    @birthday = info["birthday"]
    @date_hired = info["date_hired"]
    @department = info["department"]
  end
end
