require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "メールアドレスがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end
    it "nickname、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it " nicknameが16文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は15文字以内で入力してください")
    end
    it "nicknameが15文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "kkkk000", password_confirmation: "kkkk000")
      user.valid?
      expect(user).to be_valid
    end
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "kkk000", password_confirmation: "kkk000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it " passwordが129文字以上であれば登録できないこと " do
      user = build(:user, password: "kkk000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", password_confirmation: "kkk000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
    it " passwordが英文字のみであれば登録できないこと " do
      user = build(:user, password: "kkkkkkk", password_confirmation: "kkkkkkk")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end
    it " passwordが数字のみであれば登録できないこと " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end
  end
end