class PasswordController < ApplicationController

  def start
    render 'check.html.erb'
  end

  def check
    @user_id = params[:userid]
    @password = params[:password]

    # If user name or password is empty or nil,
    # then prompt the browser to enter something
    if @user_id.nil? || @user_id.strip.empty?
      flash.now[:alert] = "Gimme a user ID"
    # If user name or password is emtpy or nil,
    # then prompt the browser to enter something
    elsif @password.nil? || @password.strip.empty?
      flash.now[:alert] = "Gimme a password"
    # Send the user name and password to the checking
    # method to see if they are valid
    else
      if check_valid?(@user_id, @password)[:valid]
        flash.now[:notice] = "Your credentials are valid"
      else
        @value_user_id = @user_id
        @value_password = @password
        flash.now[:alert] = "Your credentials are not valid. Reason: " + check_valid?(@user_id, @password)[:reason]

      end
    end
  end

  # Purpose
  # Signature: (String, String) -> { valid: true } / { valid: false reason: "a reason"}
  # Examples:
  #   check_valid(nil, "") ->
  #   check_valid("", nil) ->
  def check_valid?(id, pw)
    if id.length >= 6 && pw.length >= 6
      if pw.include?('!') ||
         pw.include?('$') ||
         pw.include?('#')
        if !id.include?('!') &&
           !id.include?('$') &&
           !id.include?('#')
          if pw != 'password'
            { valid: true }
          else
            { valid: false, reason: "Password cannot be 'password'"}
          end
        else
          { valid: false, reason: "User id cannot include a '!' or a '$ or a '#'"}
        end
      else
        { valid: false, reason: "Password must include a '!' or a '$ or a '#'"}
      end
    else
      { valid: false, reason: "User id and password must be at least six characters long" }
    end
  end
end
