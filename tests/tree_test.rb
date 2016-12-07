require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/tree'
require './lib/insertion_sort.rb'
require 'pry'

class TreeTest < Minitest::Test

  def test_tree_has_head
    tree = Tree.new
    tree.insert(55, "Sharknado")

    assert tree.head
  end

  def test_tree_can_access_node_data
    tree = Tree.new
    tree.insert(55, "Sharknado")

    assert_equal 55, tree.head.score
    assert_equal "Sharknado", tree.head.title
  end

  def test_tree_knows_if_node_has_no_children
    tree = Tree.new
    tree.insert(55, "Sharknado")

    assert_equal nil, tree.head.right_link
    assert_equal nil, tree.head.left_link
  end


  def test_tree_inserts_left_node_with_title_and_score
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")

    assert_equal "Jaws", tree.head.left_link.title
    assert_equal 51, tree.head.left_link.score
  end


  def test_tree_inserts_right_node_with_title_and_score
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")

    assert_equal "Harry Potter and the Sorcerer's Stone", tree.head.right_link.title
    assert_equal 99, tree.head.right_link.score
  end

  def test_tree_knows_if_node_has_children
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(40, "American Pie")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")

    assert tree.head.right_link
    assert tree.head.left_link
  end

  def test_head_can_have_left_grandchild
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(42, "Weekend at Bernie's")

    assert_equal "Weekend at Bernie's", tree.head.left_link.left_link.title
    assert_equal 42, tree.head.left_link.left_link.score
  end

  def test_head_can_have_left_right_grandchild
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(42, "Weekend at Bernie's")
    tree.insert(52, "Princess Bride")

    assert_equal 52, tree.head.left_link.right_link.score
    assert_equal "Princess Bride", tree.head.left_link.right_link.title
  end

  def test_head_can_have_great_grandchildren
  tree = Tree.new
  tree.insert(55, "Sharknado")
  tree.insert(51, "Jaws")
  tree.insert(42, "Weekend at Bernie's")
  tree.insert(52, "Princess Bride")
  tree.insert(40, "American Pie")

  assert_equal 40, tree.head.left_link.left_link.left_link.score
  assert_equal "American Pie", tree.head.left_link.left_link.left_link.title
  end

  def test_head_has_depth_of_zero
    tree = Tree.new
    tree.insert(55, "Sharknado")

    assert_equal 0, tree.depth_of(55)
  end

  def test_head_children_have_depth_of_one
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")

    assert_equal 1, tree.depth_of(51)
    assert_equal 1, tree.depth_of(99)
  end

  def test_head_grandchildren_have_depth_of_two
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    assert_equal 2, tree.depth_of(40)
    assert_equal 2, tree.depth_of(100)
  end

  def test_tree_knows_if_it_has_a_score
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    assert tree.include?(55)
    assert tree.include?(51)
    assert tree.include?(99)
    assert tree.include?(40)
    assert tree.include?(100)
  end

  def test_tree_knows_it_does_not_have_a_score
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    refute tree.include?(50)
    refute tree.include?(1)
    refute tree.include?(567)
    refute tree.include?(22)
    refute tree.include?(88)
  end


  def test_tree_knows_highest_rated_movie_in_tree
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    max = {"Wall E" => 100}

    assert tree.max
    assert_equal max, tree.max
  end

  def test_tree_knows_lowest_rated_movie_in_tree
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    min = {"American Pie" => 40}

    assert tree.min
    assert_equal min, tree.min
  end

  def test_tree_returns_unsorted_array_of_movie_info
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    unsorted_movies = []
    unsorted_movies << { "Sharknado" => 55 }
    unsorted_movies << { "Jaws" => 51 }
    unsorted_movies << { "Harry Potter and the Sorcerer's Stone" => 99 }
    unsorted_movies << { "American Pie" => 40 }
    unsorted_movies << { "Wall E" => 100 }

    assert tree.unsorted_movie_info
    assert_equal unsorted_movies, tree.unsorted_movie_info
  end

  def test_tree_returns_sorted_array_of_movie_info
    tree = Tree.new
    tree.insert(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    tree.insert(40, "American Pie")
    tree.insert(100, "Wall E")

    sorted_movies = []
    sorted_movies << { "American Pie" => 40 }
    sorted_movies << { "Jaws" => 51 }
    sorted_movies << { "Sharknado" => 55 }
    sorted_movies << { "Harry Potter and the Sorcerer's Stone" => 99 }
    sorted_movies << { "Wall E" => 100 }

    assert tree.sort_movies
    assert_equal sorted_movies, tree.sorted_movie_info
  end

  def test_tree_can_print_all_file_info
    skip
    tree = Tree.new
    data = "This is the data in the file."

    assert_equal data, tree.print_all

  end

  def test_load_returns_true_from_loading_file
    tree = Tree.new

    assert tree.load
  end

  def test_tree_load_returns_correct_number_of_lines
    tree = Tree.new

    assert_equal 99, tree.load
  end

  def test_tree_returns_formatted_movie_info
    tree = Tree.new

    assert_equal Array, tree.movie_info_separated.class
  end

  def test_tree_counts_correct_number_elements_from_loading_file
    tree = Tree.new
    tree.load

    assert_equal 99, tree.movie_info_separated.count
  end

  def test_tree_knows_first_movie_data_from_loading_file
    tree = Tree.new
    tree.load

    assert_equal 71, tree.movie_info_separated[0][0]
    assert_equal "Hannibal Buress: Animal Furnace", tree.movie_info_separated[0][1]
  end

  def test_tree_creates_head_with_first_movie_from_loaded_file
    tree = Tree.new
    tree.load

    assert_equal 71, tree.head.score
    assert_equal "Hannibal Buress: Animal Furnace", tree.head.title
  end

  def test_tree_knows_health_at_varying_depths
    skip

  end

end
