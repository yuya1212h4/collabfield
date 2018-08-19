require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Associations" do
    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end

    it 'belongs_to category' do
      association = described_class.reflect_on_association(:category).macro
      expect(association).to eq :belongs_to
    end
  end

  context "Scopes" do
    it "default_scope orders by descending created_at" do
      # created_atが同時になっているために、指定してずらした
      first_post = create(:post, created_at: "2018-08-18 01:26:50")
      second_post = create(:post, created_at: "2018-08-18 01:26:51")
      expect(Post.all).to eq [second_post, first_post]
    end
  end
end
