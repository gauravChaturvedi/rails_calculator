class CalculatorController < ApplicationController
  before_filter :authenticate_user!
  def update

    if user_signed_in?
      calculator = Calculator.first_or_create!
      parser = Parser.new(calculator)
      parser.perform_operation(params[:command]) unless params[:command].nil?
      @state = calculator.state
    else
      render :text => "Sign in Please"
    end

  end


end
