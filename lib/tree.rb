require './lib/node'
require 'pry'

class Tree

  attr_reader :head
  # attr_accessor :depth_tracker

  def initialize
    @head = nil
    # @depth_tracker = 0
  end

  def insert(current_node = @head, score, title)
    depth_tracker = 0
    node = Node.new(score, title)

    if @head.nil?
      @head = node
    else
      if node.score < current_node.score && current_node.left_link == nil
        current_node.left_link = node
        depth_tracker += 1
      elsif node.score > current_node.score && current_node.right_link == nil
        current_node.right_link = node
        depth_tracker += 1
      elsif node.score < current_node.score && current_node.left_link
        current_node = current_node.left_link
        depth_tracker += 1
        insert(current_node, score, title)
      elsif node.score > current_node.score && current_node.right_link
        current_node = current_node.right_link
        insert(current_node, score, title)
        depth_tracker += 1
      end
    end
    depth_tracker
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
