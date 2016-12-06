require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/tree'
require 'pry'

class TreeTest < Minitest::Test

  def test_tree_has_head
    tree = Tree.new(55, "Sharknado")

    assert tree.head

  end

  def test_tree_can_access_node_data
    tree = Tree.new(55, "Sharknado")

    assert_equal 55, tree.head.score
    assert_equal "Sharknado", tree.head.title

  end

  def test_tree_knows_if_node_has_no_children
    tree = Tree.new(55, "Sharknado")

    assert_equal nil, tree.head.right_link
    assert_equal nil, tree.head.left_link

  end


  def test_tree_inserts_left_node_with_title_and_score
    tree = Tree.new(55, "Sharknado")

    # node_2 = Node.new(51, "Jaws")
    tree.insert(51, "Jaws")
    assert_equal "Jaws", tree.head.left_link.title
    assert_equal 51, tree.head.left_link.score
  end


  def test_tree_inserts_right_node_with_title_and_score
    tree = Tree.new(55, "Sharknado")
    # node_2 = Node.new(51, "Jaws")
    tree.insert(99, "Harry Potter and the Sorcerer's Stone")
    assert_equal "Harry Potter and the Sorcerer's Stone", tree.head.right_link.title
    assert_equal 99, tree.head.right_link.score
  end

  def test_head_can_have_left_grandchild
    tree = Tree.new(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(42, "Weekend at Bernie's")

    assert_equal "Weekend at Bernie's", tree.head.left_link.left_link.title
    assert_equal 42, tree.head.left_link.left_link.score
  end

  def test_head_can_have_left_right_grandchild
    tree = Tree.new(55, "Sharknado")
    tree.insert(51, "Jaws")
    tree.insert(42, "Weekend at Bernie's")
    tree.insert(52, "Princess Bride")

    assert_equal 52, tree.head.left_link.right_link.score
    assert_equal "Princess Bride", tree.head.left_link.right_link.title

  end

  def test_head_can_have_great_grandchildren
  tree = Tree.new(55, "Sharknado")
  tree.insert(51, "Jaws")
  tree.insert(42, "Weekend at Bernie's")
  tree.insert(52, "Princess Bride")
  tree.insert(40, "American Pie")

  assert_equal 40, tree.head.left_link.left_link.left_link.score
  assert_equal "American Pie", tree.head.left_link.left_link.left_link.title

  end

  def test_init_returns_zero_depth_for_head
    tree = Tree.new(55, "Sharknado")

    assert_equal 0, tree.depth_tracker

  end

  def test_insert_returns_one_depth_for_child
    tree = Tree.new(55, "Sharknado")
    tree.insert(40, "American Pie")

    assert_equal 1, tree.depth_tracker

  end



  def test_tree_knows_if_node_has_children
    skip
    tree = Tree.new

    assert tree.head.right_link
    assert tree.head.left_link

  end


  def test_tree_can_access_other_node_data
    skip
    tree = Tree.new

  end

  def test_tree_knows_if_it_has_a_score_already
    skip

  end

  def test_tree_knows_depth_of_score_from_head
    skip

  end

  def test_tree_knows_highest_rated_movie_in_tree
    skip

  end

  def test_tree_knows_lowest_rated_movie_in_tree
    skip

  end

  def test_tree_returns_sorted_hash_of_data
    skip

  end

  def test_tree_can_load_info_from_file
    skip

  end

  def test_tree_knows_health_at_varying_depths
    skip

  end

end
