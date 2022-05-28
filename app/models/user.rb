class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }


  #コメントの編集・削除ボタン表示の判定ロジック
  def my_comment?(comment)
    comment.user_id == id
    # comment.user_id == self.id の省略形
  end

  #汎用的に書くなら以下。Userモデルに定義することで current_user.own?(@object)と共通化できる。
  def own?(object)
    id == object.user_id
  end
  #bookmarkに配列で値を入れている
  def bookmark(board)
    self.bookmark_boards << board
  end

  #bookmarkを外す
  def unbookmark(board)
    bookmark_boards.destroy(board)
  end
  #bookmarkをつける
  def bookmark?(board)
    bookmark_boards.include?(board)
  end
  

end
