require 'rails_helper'

RSpec.describe '掲示板', type: :system do
  let(:user) { create(:user) }
  let(:board) { create(:board, user: user) }

  describe '掲示板のCRUD' do

    （略）

    describe '掲示板の詳細' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされること' do
          visit board_path(board)
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインしてください'
        end
      end

      context 'ログインしている場合' do
        before do
          board
          login_as_general
        end
        it '掲示板の詳細が表示されること' do
          visit boards_path
          within "#board-id-#{board.id}" do
            click_on board.title
          end
          expect(page).to have_content board.title
          expect(page).to have_content board.user.decorate.full_name
          expect(page).to have_content board.body
        end
      end
    end