require 'spec_helper'
require 'rails_helper'

describe Article do
  describe 'validations'do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  # describe "#subject" do
  #     it "returns the article title" do
  #       # Создаю объект article хитрым способом
  #       article = create(:article, title: 'Loren Ipsum')

  #       # assert, проверка
  #       expect(article.subject).to eq 'Loren Ipsum'

  #     end
  # end

  # describe "#last_comment" do
  #   it "return the last comment" do
  #     # создаю статью, но в этот раз с комментариями
  #     article = create(:article_with_comments)

  #     # проверка
  #     expect(article.last_comment.body).to eq "comment body 3"
  #   end
  # end

end
