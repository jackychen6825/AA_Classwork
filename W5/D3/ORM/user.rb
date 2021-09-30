require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'


class User

  attr_accessor :fname, :lname 

  def self.find_by_id(id) 
    data = QuestionsDatabase.instance.execute(<<-SQL, id) 
      SELECT 
        *
      FROM 
        users
      WHERE 
        id = ? 
    SQL
    User.new(data.first) 
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname) 
      SELECT 
        *
      FROM 
        users
      WHERE 
        fname = ? AND lname = ?
    SQL
    User.new(data.first) 
  end 

  def initialize(user_cols)
    @id = user_cols['id']
    @fname = user_cols['fname'] 
    @lname = user_cols['lname'] 
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    result = QuestionsDatabase.instance.execute(<<-SQL, @id) 
      SELECT 
        COUNT(*) AS Num_likes, CAST(COUNT(DISTINCT(questions.id)) AS FLOAT) AS Num_questions
      FROM 
        question_likes likes
      LEFT OUTER JOIN questions
      ON likes.question_id = questions.id
      WHERE questions.author_id = ?
      -- GROUP BY questions.id 
        
    SQL
    result.first['Num_likes'] / result.first['Num_questions']
  end

  def save
    if @id 
      update
    else 
      create
    end 
  end
  
  def create
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO 
          users(fname, lname)
        VALUES
          (?, ?)
        
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id 
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?,
          lname = ?
        WHERE 
          id = ?
        
      SQL
  end
end