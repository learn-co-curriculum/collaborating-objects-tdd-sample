class Author
  attr_accessor :name

  def initialize
    @stories = [] # has_many stories interface
  end

  def stories # has_many stories interface
    @stories.dup.freeze
  end

  def add_story(story) # has_many stories interface
    raise AssociationTypeMismatchError, "#{story.class} received, Story expected." if !story.is_a?(Story)
    @stories << story
    story.author = self unless story.author == self
  end

  def bibliography
    self.stories.collect{|s| s.name} # You need all stories to be instances of Story because they must respond to #name to work
    # @stories.collect(&:name) #=> Symbol to Proc
  end

  def categories # has_many categories through stories
    self.stories.collect{|s| s.category}.uniq
  end
end
