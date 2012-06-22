require 'spec_helper'

describe Comment do

  subject { FactoryGirl.create(:comment) }
    
    describe "validations" do
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:body) }
      it { should validate_presence_of(:commentable) }
    end

  describe "#story" do
    describe "commentable is a story" do
      before do
        subject.commentable = FactoryGirl.create(:story)
      end

      it "should return commentable" do
        subject.story.should == subject.commentable
      end
    end

    describe "commentable not a story" do
      before do
        subject.commentable = FactoryGirl.create(:comment_child)
      end

      it "should return commentable.story" do
        subject.story.should == subject.commentable.story
      end
    end      
  end
end
