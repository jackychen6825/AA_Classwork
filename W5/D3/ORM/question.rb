require_relative 'user'
require_relative 'reply'
require_relative 'questions_database'

class Question

  attr_accessor :title, :body, :author_id

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        questions
      WHERE
        id = ?
    SQL
    Question.new(data.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM 
        questions
      WHERE
        author_id = ?
    SQL
    data.map { |question| Question.new(question) }
  end

  def initialize(question_cols)
    @id = question_cols['id']
    @title = question_cols['title']
    @body = question_cols['body']
    @author_id = question_cols['author_id']
  end

  def author
    User.find_by_id(@author_id).fname + ' ' + User.find_by_id(@author_id).lname
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers 
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  
end