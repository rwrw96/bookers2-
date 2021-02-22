class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :profile_image_id, ImageUploader
  
  validates :name , uniqueness: true , length: {minimum: 2, maximum: 20}
  
  has_many :books, dependent: :destroy
end
