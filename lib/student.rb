class Student
  attr_reader :name, :age, :scores, :account

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
    @account = 0
  end

  def log_score(score)
    scores << score
  end

  def grade
    scores.sum(0.0) / scores.size
  end

  def charge
    # require 'pry'; binding.pry
    @account += 1
  end
end
