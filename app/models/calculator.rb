class Calculator < ActiveRecord::Base
  before_save :initialize_state
  # def initialize state=0
  #   @state = state
  # end

  def initialize_state
    self.state =0 if self.state.nil?
  end

  def + value
    self.state += value
    self.save
  end

  def - value
    self.state -= value
    self.save
  end

  def * value
    self.state *= value
    self.save
  end

  def / value
      if(value != 0)
        self.state /= value
        self.state.round(2)
        self.save
      else
        return "can not divide by zero"
      end



  end

  def reset
    self.state = 0
    self.save
  end

end
