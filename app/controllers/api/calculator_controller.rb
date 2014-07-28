class Api::CalculatorController < ApplicationController

  def create
    if calculator.first
      head 200
    else
      calculator = Calculator.create(:state => 0)
       if(!calculator.nil?)
         head 201
       end
    end

  end

  def update
    calculator = Calculator.first_or_create!
    parser = Parser.new(calculator)
    parser.perform_operation(params[:command]) unless params[:command].nil?
    render :json => {:result => calculator.state}
  end
end