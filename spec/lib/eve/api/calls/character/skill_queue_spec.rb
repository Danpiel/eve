require 'spec_helper'

describe Eve::API::Services::Character do
  context "#skill_queue" do
    context "with a valid api key" do
      subject { mock_service('character', 'skill_queue', :user_id => '01234567890',
                                                     :character_id => '1234567890',
                                                     :api_key => 'a_valid_api_key') }

      it "should return the character's training queue" do
        subject.skillqueue.should behave_like_rowset('queuePosition,typeID,level,startSP,endSP,startTime,endTime')
      end
    end

    context "without an api key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'skill_queue') }.should raise_error(ArgumentError)
      end
    end
  end
end
