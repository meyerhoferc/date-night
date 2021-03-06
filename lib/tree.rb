require './lib/node'
require './lib/insertion_sort.rb'
require 'pry'

class Tree

  attr_reader :head
  attr_accessor :unsorted_movie_info, :sorted_movie_info, :movie_info_separated

  def initialize
    @head = head
    @unsorted_movie_info = []
    @sorted_movie_info = []
    @movie_info_separated = []
    @scores_at_a_depth = {}
  end

  def insert(current_node = @head, score, title)
    depth_tracker = 0
    node = Node.new(score, title)

    if @head.nil?
      @head = node
      @unsorted_movie_info << { node.title => node.score }
      depth_tracker
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
  end

  def load(file = ARGV.first)
    line_count = 0
    opened_file = open(file, 'r')
    raw_movie_info = []
    while line = opened_file.gets
      line_count += 1
      raw_movie_info << line
    end

    raw_movie_info.each do |movie|
      split_info = movie.split(", ")
      score = split_info[0].to_i
      title = split_info[1].chomp
      @movie_info_separated << [score, title]
    end

    @movie_info_separated.each do |pair|
      score = pair[0]
      title = pair[1]
      insert(score, title)
    end
    line_count
  end

  # def health(depth)
  #   health_stats = []
  #   scores = score_finder(depth)
  #   scores.each do |score|
  #     right_children = find_right_children(score)
  #     left_children = find_left_children(score)
  #     children = right_children + left_children
  #     total = @sorted_movie_info.count
  #
  #     health_stats << [score, 1 + children, ((1+children)/total).to_i]
  #   end
  # end

  def scores_at_a_depth
    all_scores = @movie_info_separated.map { |element| element[0] }
    all_scores.each do |score|
      depth = depth_of(score)
      if @scores_at_a_depth.include?(depth)
        @scores_at_a_depth[depth] << score
      else
        @scores_at_a_depth[depth] = [score]
      end
    end
    @scores_at_a_depth
  end

  def score_finder(depth)
    @scores_at_a_depth[depth]
  end

end
#
# tree = Tree.new
# tree.load
# tree.sort_movies
# puts tree.sorted_movie_info.count
# puts tree.scores_at_a_depth
# puts tree.sorted_movie_info
