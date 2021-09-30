require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'questions_database'

class QuestionLike
  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.id
      FROM question_likes likes
      JOIN questions 
      ON likes.question_id = questions.id
      GROUP BY questions.id
      ORDER BY COUNT(*) DESC
      LIMIT ?
    SQL
     questions.map { |hash_id| Question.find_by_question_id(hash_id['id']) }

  end

  def self.likers_for_question_id(question_id)
    people = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users 
      WHERE id IN (
        SELECT 
          user_id
        FROM 
          question_likes 
        WHERE 
          question_id = ?
      )
    SQL
    people.map { |user| User.new(user) }
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT DISTINCT questions.*
      FROM question_likes ql
      JOIN questions 
      ON ql.question_id = questions.id 
      WHERE ql.user_id = ?
    SQL
    questions.map { |question| Question.new(question) }

  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(*) AS count 
      FROM question_likes 
      WHERE question_id = ?
    SQL
    num_likes.first['count']
  end 

  def initialize(like_cols)
    @id, @user_id, @question_id = like_cols['id'], like_cols['user_id'], like_cols['question_id']
  end

end