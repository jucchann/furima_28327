require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの保存' do
    context 'コメントの保存ができるとき' do
      it '全ての情報があればコメントの保存ができる' do
      expect(@comment).to be_valid
      end
    end

    context 'コメントの保存ができないとき' do
      it 'textが空だと保存できない' do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end
