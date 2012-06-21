require 'spec_helper'

describe Comment do

  subject { FactoryGirl.create(:comment) }
    
    describe "validations" do
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:story_id) }
      it { should validate_presence_of(:body) }
    end


end
