class Student < ActiveRecord::Base

  belongs_to :investigation_group

  has_many :profiles

  has_many :event_students
	has_many :events, through: :event_students

	has_many :user_contributions
	has_many :contributions, through: :user_contributions

	has_many :history_groups

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
