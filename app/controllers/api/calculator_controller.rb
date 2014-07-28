class Api::CalculatorController < ApplicationController

  def update
    calculator = Calculator.first_or_create!
    parser = Parser.new(calculator)
    parser.perform_operation(params[:command]) unless params[:command].nil?
    render :json => {:result => calculator.state}
  end
end