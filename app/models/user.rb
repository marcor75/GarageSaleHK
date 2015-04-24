class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # check that user field is not left blank:
  validates :name, presence: true

  #defining the relationship user to listings db; listings' existence depends on user's existence 
  # i.e. if user profile has been deleted, listings are automatically deleted too
  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id" #?, dependent: :destroy
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id" #?, dependent: :destroy
end
