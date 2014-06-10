class Idea
  attr_reader :title, :description, :rank
  attr_accessor :id
  def initialize(title, description)
    @title = title
    @description = description
    @rank = 0
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    rank <=> other.rank
  end
end
