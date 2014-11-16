require 'spec_helper'

describe "Doc pages", type: :request do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "add document" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not add a document" do
        expect { click_button "Add document" }.not_to change(Doc, :count)
      end

      describe "error messages" do
        before { click_button "Add document" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'doc_url', with: "http://arxiv.org/pdf/1409.3016.pdf" }
      it "should add a document" do
        expect { click_button "Add document" }.to change(Doc, :count).by(1)
      end
    end
  end

end
