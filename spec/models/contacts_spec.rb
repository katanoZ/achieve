require 'rails_helper'

describe Contact do
  #名前とメールアドレスと内容があれば有効な状態であること
  it "is valid with name and email and content" do
    contact = Contact.new(name: "サンプル名前", email: "name@sample.com", content: "問い合わせ内容です")
    expect(contact).to be_valid
  end

  #名前がなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new(email: "name@sample.com", content: "問い合わせ内容です")
    expect(contact).not_to be_valid
  end

  #名前がない場合のエラーが発生していること
  it "is an error without a name" do
    contact = Contact.new(email: "name@sample.com", content: "問い合わせ内容です")
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  #メールアドレスがなければ無効であること
  it "is invalid without an email" do
    contact = Contact.new(name: "サンプル名前", content: "問い合わせ内容です")
    expect(contact).not_to be_valid
  end

  #メールアドレスがない場合のエラーが発生していること
  it "is an error without an email" do
    contact = Contact.new(name: "サンプル名前", content: "問い合わせ内容です")
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  #内容がなければ無効であること
  it "is invalid without a content" do
    contact = Contact.new(name: "サンプル名前", email: "name@sample.com")
    expect(contact).not_to be_valid
  end

  #内容がない場合のエラーが発生していること
  it "is an error without a content" do
    contact = Contact.new(name: "サンプル名前", email: "name@sample.com")
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
