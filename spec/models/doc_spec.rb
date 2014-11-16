require 'spec_helper'

describe Doc, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  before { @doc = user.docs.build(url: "http://arxiv.org/pdf/1411.3322") }

  subject { @doc }

  it { should respond_to(:url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Doc.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @doc.user_id = nil }
    it { should_not be_valid }
  end
end
