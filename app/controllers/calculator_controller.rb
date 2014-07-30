class CalculatorController < ApplicationController

  def update
      calculator = Calculator.first_or_create!
      parser = Parser.new(calculator)
      parser.perform_operation(params[:command]) unless params[:command].nil?
      @state = calculator.state
  end


end
