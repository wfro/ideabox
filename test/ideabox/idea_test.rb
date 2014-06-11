require './test/ideabox/test_helper'
require './lib/ideabox/idea'

class IdeaTest < Minitest::Test
  def test_basic_idea
    idea = Idea.new("title", "description")
    assert_equal "title", idea.title
    assert_equal "description", idea.description
  end

  def test_ideas_can_be_liked
    idea = Idea.new("diet", "carrots and cucumbers")
    assert_equal 0, idea.rank
    idea.like!
    assert_equal 1, idea.rank
    idea.like!
    assert_equal 2, idea.rank
  end

  def test_ideas_can_be_sorted_by_rank
    diet = Idea.new("diet", "cabbage soup")
    exercise = Idea.new("exercise", "long distance running")
    drink = Idea.new("drink", "carrot smoothy")

    exercise.like!
    exercise.like!
    drink.like!

    ideas = [drink, exercise, diet]
    assert_equal [diet, drink, exercise], ideas.sort
  end

  def test_ideas_have_an_id
    idea = Idea.new("dinner", "beef stew")
    idea.id = 1
    assert_equal 1, idea.id
  end

  def test_a_new_idea
  idea = Idea.new('sleep', 'all day')
  idea.id = 1
  refute idea.new?
  end
end
