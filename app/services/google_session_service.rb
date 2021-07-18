class GoogleSessionService
  attr_reader :user

  def initialize(args)
    @name = args[:name]
    @username = args[:username]
    @user = User.find_or_initialize_by(email: args[:email])
  end

  def execute
    @user.password = SecureRandom.hex
    @user.username = @username
    @user.name = @name
    @user.save!
  end
end
