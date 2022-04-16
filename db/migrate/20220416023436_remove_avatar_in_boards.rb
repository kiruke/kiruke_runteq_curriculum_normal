class RemoveAvatarInBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :avatar, :string
  end
end
