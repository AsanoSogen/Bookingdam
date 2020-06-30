# frozen_string_literal: true

require 'rails_helper'
describe Address do
  describe '#create' do
    it '郵便番号がない場合は登録できないこと' do
      address = build(:address, postal_code: '')
      address.valid?
      expect(address.errors[:postal_code]).to include('を入力してください')
    end
    it '電話番号がない場合は登録できないこと' do
      address = build(:address, phone_number: '')
      address.valid?
      expect(address.errors[:phone_number]).to include('を入力してください')
    end
    it '電話番号がない場合は登録できないこと' do
      address = build(:address, phone_number: '')
      address.valid?
      expect(address.errors[:phone_number]).to include('を入力してください')
    end
    it '都道府県がない場合は登録できないこと' do
      address = build(:address, prefectures: '')
      address.valid?
      expect(address.errors[:prefectures]).to include('を入力してください')
    end
    it '市町村がない場合は登録できないこと' do
      address = build(:address, municipalities: '')
      address.valid?
      expect(address.errors[:municipalities]).to include('を入力してください')
    end
    it '番地がない場合は登録できないこと' do
      address = build(:address, address: '')
      address.valid?
      expect(address.errors[:address]).to include('を入力してください')
    end
    it '郵便番号が非正規の場合は登録できないこと' do
      address = build(:address, postal_code: '30-9999')
      address.valid?
      expect(address.errors[:postal_code]).to include('郵便番号の様式で入力してください')
    end
    it '電話番号が非正規の場合は登録できないこと' do
      address = build(:address, phone_number: '760-999-76512')
      address.valid?
      expect(address.errors[:phone_number]).to include('は不正な値です')
    end
  end
end
