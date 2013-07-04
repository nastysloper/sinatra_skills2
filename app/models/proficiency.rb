class Proficiency < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  def is_formal?
    if formal
      return "Yes"
    else
      return "No"
    end
  end
end
