class Question
  include MongoMapper::Document

  key :ask, String
  key :detail, String

  validates_presence_of :ask

end
