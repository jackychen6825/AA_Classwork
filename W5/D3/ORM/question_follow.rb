require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'questions_database'

class QuestionFollow 

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.* #?
      FROM 
        question_follows qf
      JOIN 
        questions q 
      ON 
        qf.question_id = q.id
      GROUP BY
        q.title
      ORDER BY
        COUNT(*) DESC
      LIMIT ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  


  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.*
      FROM 
        question_follows q
      JOIN 
        users u 
      ON 
        q.user_id = u.id
      WHERE
        q.question_id = ?
    SQL
    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        question_follows q
      JOIN 
        questions  
      ON 
        q.question_id = questions.id
      WHERE
        q.user_id = ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  def initialize(qf_cols)
    @id = qf_cols['id']
    @user_id = qf_cols['user_id']
    @question_id = qf_cols['question_id'] 
  end
  

end