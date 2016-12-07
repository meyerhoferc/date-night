require './lib/node'
require './lib/insertion_sort.rb'
require 'pry'

class Tree

  attr_reader :head
  attr_accessor :unsorted_movie_info, :sorted_movie_info

  def initialize
    @head = head
    @unsorted_movie_info = []
    @sorted_movie_info = []
  end
  #
  # def insert(current_node = @head, score, title)
  #   depth_tracker = 0
  #   node = Node.new(score, title)
  #
  #   if @head.nil?
  #     @head = node
  #   else
  #     if node.score < current_node.score && current_node.left_link == nil
  #       current_node.left_link = node
  #       depth_tracker += 1
  #     elsif node.score > current_node.score && current_node.right_link == nil
  #       current_node.right_link = node
  #       depth_tracker += 1
  #     elsif node.score < current_node.score && current_node.left_link
  #       depth_tracker += 1
  #       insert(current_node.left_link, score, title)
  #     elsif node.score > current_node.score && current_node.right_link
  #       insert(current_node.right_link, score, title)
  #       depth_tracker += 1
  #     end
  #   end
  #   depth_tracker
  # end


  def insert(current_node = @head, score, title)
    depth_tracker = 0
    node = Node.new(score, title)

    if @head.nil?
      @head = node
      @unsorted_movie_info << { node.title => node.score }
    else
      if node.score < current_node.score && current_node.left_link == nil
        current_node.left_link = node
        @unsorted_movie_info << { node.title => node.score }
        depth_tracker += 1
      elsif node.score > current_node.score && current_node.right_link == nil
        current_node.right_link = node
        @unsorted_movie_info << { node.title => node.score }
        depth_tracker += 1
      elsif node.score < current_node.score && current_node.left_link
        depth_tracker += 1
        insert(current_node.left_link, score, title)
      elsif node.score > current_node.score && current_node.right_link
        insert(current_node.right_link, score, title)
        depth_tracker += 1
      end
    end
    depth_tracker
  end

  def depth_of(score, distance_from_head = 0, current_node = @head)
    if score == current_node.score
      distance_from_head
    elsif score < current_node.score
      distance_from_head += 1
      depth_of(score, distance_from_head, current_node.left_link)
    else
      distance_from_head += 1
      depth_of(score, distance_from_head, current_node.right_link)
    end
  end

  def include?(score, current_node = @head)
    if score == current_node.score
      true
    elsif score < current_node.score && current_node.left_link != nil
      include?(score, current_node.left_link)
    elsif score > current_node.score && current_node.right_link != nil
      include?(score, current_node.right_link)
    else
      false
    end
  end

  def max(current_node = @head)
    if current_node.right_link != nil
      max(current_node.right_link)
    else
      { current_node.title => current_node.score }
    end
  end


  def min(current_node = @head)
    if current_node.left_link != nil
      min(current_node.left_link)
    else
      { current_node.title => current_node.score }
    end
  end

  def sort_movies
    sorter = InsertionSort.new
    @sorted_movie_info = sorter.sort(@unsorted_movie_info)
    # binding.pry
    # @sorted_movie_info
  end


  # def sort(current_node = @head, current_score = current_node.score)
  #   ranked_movies = []
  #   if ranked_movies[0].nil?
  #     ranked_movies << { current_node.title => current_node.score }
  #   end
  # end

  #
  # def sort(current_node = @head, current_score = current_node.score)
  #   ranked_movies = []
  #   if current_node.left_link != nil
  #     sort(current_node.left_link)
  #   else
  #     ranked_movies << { current_node.title => current_score }
  #   end
  # end


  #
  # def compare_right(new_node, current_node)
  #   current_node.left_link.right_link = new_node
  #
  # end
  # def compare_left(new_node, current_node)
  #   current_node.left_link.left_link = new_node
  # end

end
