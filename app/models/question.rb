class Question
  include MongoMapper::Document

  key :ask, String
  key :detail, String

  many :answers
    
  validates_presence_of :ask
end
