require './test/ideabox/test_helper'
require './lib/ideabox/idea_store'
require './lib/ideabox/idea'

class IdeaStoreTest < Minitest::Test

  def teardown
    IdeaStore.delete_all
  end
  
  def test_save_and_retrieve_ideas
    idea = Idea.new("celebrate", "with champagne")
    id1 = IdeaStore.save(idea)

    assert_equal 1, IdeaStore.count

    idea = Idea.new("dream", "of unicorns and rainbows")
    id2 = IdeaStore.save(idea)

    assert_equal 2, IdeaStore.count

    idea = IdeaStore.find(id1)
    assert_equal "celebrate", idea.title
    assert_equal "with champagne", idea.description

    idea = IdeaStore.find(id2)
    assert_equal "dream", idea.title
    assert_equal "of unicorns and rainbows", idea.description
  end

  def test_update_idea
    idea = Idea.new("drink", "tomato juice")
    id = IdeaStore.save(idea)

    idea = IdeaStore.find(id)
    idea.title = "cocktails"
    idea.description = "spicy tomato juice with vodka"

    IdeaStore.save(idea)

    assert_equal 1, IdeaStore.count

    idea = IdeaStore.find(id)
    assert_equal "cocktails", idea.title
    assert_equal "spicy tomato juice with vodka", idea.description
  end

  def test_update_values
  idea = Idea.new("drinks", "sparkly water")
  idea.title = "happy hour"
  idea.description = "mojitos"
  assert_equal "happy hour", idea.title
  assert_equal "mojitos", idea.description
end
end
