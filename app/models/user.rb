class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :weathers
  has_many :reviews
  has_many :votes

  validates :role,
    inclusion: { in: ["member", "admin"] }

  def admin?
    role == "admin"
  end
end
