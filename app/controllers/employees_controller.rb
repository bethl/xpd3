class EmployeesController < ApplicationController
  
  def index
    @employee = Employee.new
  end

  # When the user clicks "Make User employee" this method fires up
  # And sets it up
  def create
    # Get User by username...
    user_input = params[:user][:email]
    @user =  User.where(:email => user_input).first  

    @employee = Employee.create(params[:employee])

    if @user.nil?
      flash[:error] = "Error:  User #{user_input} not found."
      #flash[:secret] = "<script>alert('hi');</script>".html_safe
      redirect_to '/manage'
      return
    end

    # Make sure user is not already set to an employee
    #@employee = Employee.new

    @user.employee = @employee

    @user.save
    # print "Employee Created!"
    if !@user.employee.nil?
      flash[:success] = "User successfully set to employee!"
      redirect_to @user
    else
      flash[:error] = "An error occured creating employee..."
      p @user.employee
      redirect_to @user
    end


  end

  def destroy
    
  end
end
