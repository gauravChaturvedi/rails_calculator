require 'rails_helper'

describe 'Parser' do


  let (:calculator) { Calculator.new({:state => 5}) }
  let (:parser) { Parser.new(calculator) }
  context '#parse' do

    context '#addition' do
      it 'should perform operation on "add 5" and return 10  ' do
        parser.perform_operation("add 5")
        expect(calculator.state).to eq(10)
      end

    end

    context '#subtraction' do

      it 'should perform operation on "sub 3" and return 2' do
        parser.perform_operation("sub 3")
        expect(calculator.state).to eq(2)
      end

    end

    context '#multiplication' do

      it 'should perform operation on "mul 5" and return 25' do
        parser.perform_operation("mul 5")
        expect(calculator.state).to eq(25)
      end

    end


    context '#division' do
      it 'should perform operation on "div 5" and return 1  ' do
        parser.perform_operation("div 5")
        expect(calculator.state).to eq(1)
      end
    end

    context '#reset' do
      it 'should perform operation on "reset" and return 0  ' do
        parser.perform_operation("reset")
        expect(calculator.state).to eq(0)
      end
    end

    context '#Invalid Input' do
      it 'should do nothing on an invalid command  ' do
        initial_state = calculator.state
        parser.perform_operation("invalid input")
        expect(calculator.state).to eq(initial_state)
      end
    end

  end


end