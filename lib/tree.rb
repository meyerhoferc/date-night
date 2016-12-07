require './lib/node'
require 'pry'

class Tree

  attr_reader :head

  def initialize
    @head = head
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

  def depth_of(score, distance_from_head = 0, current_node = @head)
    if score == current_node.score
      distance_from_head
    elsif score < current_node.score
      current_node = current_node.left_link
      distance_from_head += 1
      depth_of(score, distance_from_head, current_node)
    else
      current_node = current_node.right_link
      distance_from_head += 1
      depth_of(score, distance_from_head, current_node)
    end
  end

  def include?(score, current_node = @head)
    if score == current_node.score
      true
    elsif score < current_node.score && current_node.left_link != nil
      current_node = current_node.left_link
      include?(score, current_node)
    elsif score > current_node.score && current_node.right_link != nil
      current_node = current_node.right_link
      include?(score, current_node)
    else
      false
    end
  end

  def max(current_node = @head)
    max_movie = {}
    if current_node.right_link != nil
      current_node = current_node.right_link

      max(current_node)
    else
      max_score = current_node.score
      max_title = current_node.title

      max_movie = { max_title => max_score}
    end
  end


  def min(current_node = @head)
    min_movie = {}
    if current_node.left_link != nil
      current_node = current_node.left_link

      min(current_node)
    else
      min_score = current_node.score
      min_title = current_node.title

      min_movie = { min_title => min_score}
    end
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
