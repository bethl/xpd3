class EmployeesController < ApplicationController
  
  def index
    @employee = Employee.new
  end

  # When the user clicks "Make User employee" this method fires up
  # And sets it up
  def create
    # Get User by username...
    @user =  User.where(:email => params[:user][:email]).first  

    # Make sure user is not already set to an employee
    #@employee = Employee.new

    #p e
    @user.employee = Employee.create(params[:employee])

    # print "Employee Created!"
    if @user.save
      flash[:success] = "User successfully set to employee!"
      redirect_to @user
    else
      flash[:error] = "An error occured..."
      p @user.employee
      redirect_to @user
    end


  end

  def destroy
    
  end
end
