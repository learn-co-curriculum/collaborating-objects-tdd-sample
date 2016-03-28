require 'pry'

require_relative '../lib/author'
require_relative '../lib/category'
require_relative '../lib/story'

class AssociationTypeMismatchError < TypeError; end
