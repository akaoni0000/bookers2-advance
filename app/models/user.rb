class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  has_many :commnts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

  has_many :following_user, through: :follower, source: :passive # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :active # 自分をフォローしている人

  # ユーザーをフォローする
  def follow(user_id)  #current_user.follow(user) 
    follower.create(followed_id: user_id, follower_id: self.id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)          #current_user.following?(user) 
    following_user.include?(user)
  end

  def User.search(search, user_or_book, how_search)
      if  how_search == "1"
            User.where(['name LIKE ?', "%#{search}%"])
      elsif how_search == "2"
            User.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "3"
            User.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "4"
            User.where(['name LIKE ?', "#{search}"])
      else
            User.all
      end
  end

end



