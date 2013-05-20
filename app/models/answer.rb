class Answer
  include MongoMapper::Document

  key :answer, String

  belongs_to :question

  validates_presence_of :answer

end
