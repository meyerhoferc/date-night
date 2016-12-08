require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_node_has_and_knows_title
    title = "Movie Title"
    score = 93
    node = Node.new(score, title)

    assert_equal "Movie Title", node.title
  end

  def test_node_has_and_knows_score
    title = "Movie Title"
    score = 93
    node = Node.new(score, title)

    assert_equal 93, node.score
  end

  def test_node_has_empty_right_link_by_default
    title = "Movie Title"
    score = 93
    node = Node.new(score, title)

    assert_equal nil, node.right_link
  end

  def test_node_has_empty_left_link_by_default
    title = "Movie Title"
    score = 93
    node = Node.new(score, title)

    assert_equal nil, node.left_link
  end

  def test_node_can_right_link_to_another_node
    title_1 = "ham shanks"
    title_2 = "ice cream"
    score_1 = 50
    score_2 = 98
    node_1 = Node.new(score_1, title_1)
    node_2 = Node.new(score_2, title_2)

    node_1.right_link = node_2
    assert_equal node_2, node_1.right_link
    assert_equal "ice cream", node_1.right_link.title
    assert_equal 98, node_1.right_link.score
  end

  def test_node_can_left_link_to_another_node
    title_1 = "ham shanks"
    title_2 = "Sharknado"
    score_1 = 50
    score_2 = 35

    node_1 = Node.new(score_1, title_1)
    node_2 = Node.new(score_2, title_2)

    node_1.left_link = node_2
    assert_equal node_2, node_1.left_link
    assert_equal "Sharknado", node_1.left_link.title
    assert_equal 35, node_1.left_link.score
  end

  # def test_node_can_add_link_to_link
  #   data_1 = "ham shanks"
  #   data_2 = "ice cream"
  #   data_3 = "cannoli"
  #   node_1 = Node.new(data_1)
  #   node_2 = Node.new(data_2)
  #   node_3 = Node.new(data_3)
  #
  #   node_1.link = node_2
  #   node_1.link.link = node_3
  #   assert_equal data_3, node_1.link.link.data
  #
  # end

end
