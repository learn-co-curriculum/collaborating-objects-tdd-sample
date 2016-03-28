class Story
  attr_accessor :name
  attr_reader :author # Belongs to author

  def author=(author) # Belongs to author
    raise AssociationTypeMismatchError, "#{author.class} received, Author expected." if !author.is_a?(Author)
    @author = author
    author.add_story(self) unless author.stories.include?(self)
  end

  attr_reader :category # Belongs to category

  def category=(category) # Belongs to category
    raise AssociationTypeMismatchError, "#{category.class} received, Category expected." if !category.is_a?(Category)
    @category = category
    category.add_story(self) unless category.stories.include?(self)
  end

end
