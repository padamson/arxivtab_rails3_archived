require 'spec_helper'

describe Doc do

  before do
    # This code is wrong!
    @doc = Doc.new(url: "http://www.example.org/example.pdf",
                   tabbed_at: Time.current)
  end
  subject { @doc }

  it { should respond_to(:url) }
  it { should respond_to(:tabbed_at) }

  it { should be_valid }

  describe "when url is not present" do
    before { @doc.url = nil }
    it { should_not be_valid }
  end
end
