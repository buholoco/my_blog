class Blog < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :presence => true,
                    :length => { :in => 5..50 }

  validates :content, :presence => true,
                      :length => { :minimum => 10 }

  before_validation :strip_whitespaces
  

  def strip_whitespaces
    if !title.blank?
      self.title = self.title.strip
      self.content = self.content.strip
    end
  end
end
