require './lib/node'

class Tree

  attr_reader :head
  attr_accessor :depth_tracker

  def initialize(score, title)
    @head = Node.new(score, title)
    @depth_tracker = 0
  end

  #
  # def insert(title, score)
  #   node = Node.new(title, score)
  #   if node.score < @head.score
  #     @head.left_link = node
  #   else
  #     @head.right_link = node
  #   end
  # end
  #
  # def insert(score, title)
  #   node = Node.new(score, title)
  #   if node.score < @head.score && @head.left_link == nil
  #     @head.left_link = node
  #   elsif node.score > @head.score && @head.right_link == nil
  #     @head.right_link = node
  #   elsif node.score < @head.score && node.score < @head.left_link.score && @head.left_link.left_link == nil
  #     compare_left(node, @head)
  #   elsif node.score < @head.score && node.score > @head.left_link.score && @head.left_link.right_link == nil
  #     compare_right(node, @head)
  #   end
  # end
  #
  # def insert(score, title)
  #   if @head.nil?
  #     @head = Node.new(score, title)
  #   elsif score < @head.score
  #     new_node = Node.new(score, title)
  #
  #   elsif score > @head.score
  #     new_node = Node.new(score, title)
  #   else
  #     new_node = Node.new(score, title)
  # end
  #
  # def insert(score, title)
  #   node = Node.new(score, title)
  #   current_node = @head
  #   if node.score < current_node.score && current_node.left_link == nil
  #     current_node.left_link = node
  #   elsif node.score > current_node.score && current_node.right_link == nil
  #     current_node.right_link = node
  #   elsif node.score < current_node.score && node.score < current_node.left_link.score && current_node.left_link.left_link == nil
  #     compare_left(node, current_node)
  #   elsif node.score < current_node.score && node.score > current_node.left_link.score && current_node.left_link.right_link == nil
  #     compare_right(node, current_node)
  #   end
  # end


  def insert(current_node = @head, score, title)
    node = Node.new(score, title)

    if @head.nil?
      @head = node
    end


    if node.score < current_node.score && current_node.left_link == nil
      current_node.left_link = node
      @depth_tracker += 1
    elsif node.score > current_node.score && current_node.right_link == nil
      current_node.right_link = node
      @depth_tracker += 1
    elsif node.score < current_node.score && current_node.left_link
      current_node = current_node.left_link
      @depth_tracker += 1
      insert(current_node, score, title)
    elsif node.score > current_node.score && current_node.right_link
      current_node = current_node.right_link
      insert(current_node, score, title)
      @depth_tracker += 1
    end

    @depth_tracker

  end

  #
  # def compare_right(new_node, current_node)
  #   current_node.left_link.right_link = new_node
  #
  # end
  # def compare_left(new_node, current_node)
  #   current_node.left_link.left_link = new_node
  # end

end
