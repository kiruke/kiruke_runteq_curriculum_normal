class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user
  validates :body, presence: true, length: { maximum: 65535 }

  #コメントの編集・削除ボタン表示の判定ロジック
  def my_comment?(comment)
    self == comment.user
  end
  
end
