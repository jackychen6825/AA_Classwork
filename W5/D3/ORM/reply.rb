require_relative 'user'
require_relative 'question'
require_relative 'questions_database'

class Reply
  attr_reader :id, :parent_id, :question_id

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies 
      WHERE user_id = ?
    SQL
    data.map { |reply| Reply.new(reply) } 
  end 

  def self.find_by_question_id(question_id) 
    parent_replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies 
      WHERE question_id = ? 
    SQL
    parent_replies.map { |reply| Reply.new(reply) }    
  end 

  def initialize(reply_cols)
    @id = reply_cols['id']
    @question_id = reply_cols['question_id']
    @parent_id = reply_cols['parent_id']
    @user_id = reply_cols['user_id']
    @body = reply_cols['body']
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM replies 
      WHERE parent_id = ? 
    SQL

    data.map { |reply| Reply.new(reply) } 
  end

  def parent_reply
    data = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
      SELECT *
      FROM replies 
      WHERE id = ? 
    SQL

    Reply.new(data.first)
  end

  def question
    data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
      SELECT *
      FROM questions 
      WHERE id = ? 
    SQL

    Question.new(data.first)
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT *
      FROM users 
      WHERE id = ? 
    SQL

    User.new(data.first)
  end
end