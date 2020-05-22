require 'rails_helper'
describe Book do
  describe '#create' do
    it "タイトルがない場合は登録できないこと" do
      book = build(:book, title: "")
      book.valid?
      expect(book.errors[:title]).to include("を入力してください")
    end
    it "タイトルがない場合は登録できないこと" do
        book = build(:book, text: "")
        book.valid?
        expect(book.errors[:text]).to include("を入力してください")
    end
    it "詳細文がない場合は登録できないこと" do
        book = build(:book, text: "")
        book.valid?
        expect(book.errors[:text]).to include("を入力してください")
    end
    it "写真がない場合は登録できないこと" do
        book = build(:book, image: "")
        book.valid?
        expect(book.errors[:image]).to include("を入力してください")
    end
    it "開催日がない場合は登録できないこと" do
        book = build(:book, published_at: "")
        book.valid?
        expect(book.errors[:published_at]).to include("を入力してください")
    end
    it "予約締め切り日がない場合は登録できないこと" do
        book = build(:book, end_day: "")
        book.valid?
        expect(book.errors[:end_day]).to include("を入力してください")
    end
    it "開催場所がない場合は登録できないこと" do
        book = build(:book, address: "")
        book.valid?
        expect(book.errors[:address]).to include("を入力してください")
    end
    it "緯度がない場合は登録できないこと" do
        book = build(:book, latitude: "")
        book.valid?
        expect(book.errors[:latitude]).to include("を入力してください")
    end
    it "軽度がない場合は登録できないこと" do
        book = build(:book, longitude: "")
        book.valid?
        expect(book.errors[:longitude]).to include("を入力してください")
    end
  end
end
