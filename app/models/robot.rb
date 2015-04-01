class Robot
  attr_reader :name, :id, :avatar
  
  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @city = data["city"]
    @state = data["state"]
    @avatar = data["avatar"]
    @birthday = data["birthday"]
    @date_hired = data["date_hired"]
  end
end
