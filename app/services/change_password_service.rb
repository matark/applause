class ChangePasswordService
  def initialize(params)
    @new_password = params[:new_password]
    @current_password = params[:current_password]
  end

  def execute(user)
    if user.authenticate(@current_password)
      user.update!(password: @new_password)
    end
  end
end
