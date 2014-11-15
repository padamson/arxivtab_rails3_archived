require 'spec_helper'

describe "Doc pages" do

  subject { page }

  describe "docs#new" do
    before { visit docs_new_path }

    it { should have_content('Add document') }
    it { should have_title(full_title('Add document')) }
  end
end
