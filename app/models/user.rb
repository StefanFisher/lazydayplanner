class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :movies
  has_many :movie_overrides, dependent: :destroy
  has_many :movie_prefs, dependent: :destroy
  has_many :genre_overrides, dependent: :destroy
end
