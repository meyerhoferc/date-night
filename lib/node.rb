class Node
  attr_reader :title, :score
  attr_accessor :right_link, :left_link

  def initialize(score, title)
    @title      = title
    @score      = score
    @right_link = right_link
    @left_link  = left_link
  end
  #
  # def right_link
  # end
  #
  # def left_link
  # end

end
