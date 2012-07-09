require 'spec_helper'

describe Votable do

  subject { FactoryGirl.create(:story) }
  comment = FactoryGirl.create(:comment)
  vote    = FactoryGirl.create(:vote)

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
  end

  describe "#comment_count" do
    describe "has no comments" do
      it "should return 0" do
        subject.comment_count.should == 0
      end
    end

    describe "has a child" do
      it "should return 1" do
        comment.commentable.comment_count.should == 1
      end
    end
  end


  describe '#update_score' do
    describe 'has 0 votes' do
      it 'should have score = 0' do
        subject.score.should == 0
      end
    end

    describe 'has 1 vote' do
      before do
        vote.votable = subject
        vote.save
      end
      it 'should have score = 1' do
        subject.update_score
        subject.score.should == 1
      end
    end
  end
end

