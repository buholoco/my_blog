class Comment < ActiveRecord::Base
  attr_accessible :content, :email

  belongs_to :blog

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :content, presence: true
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }

  before_save :downcase_email!

  private
  def downcase_email!
    email.downcase!
  end
end
