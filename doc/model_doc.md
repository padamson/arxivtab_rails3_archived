# A Doc Model

Before adding a resource for user *tabs*, we need to add a resource for
the documents that will be tabbed.  We'll call this resource a *'Doc'*. 
Since the only types of documents we are planning to tab in *arTab.org* are
PDFs with dedicated URLs, the Doc model needs only one attribute: a `url` 
attribute that is a `string` to hold the doc's URL.  We generate it using 
`generate model`:

`$ rails generate model Doc url:string`

This results in a migration file `[timestamp]_create_docs.rb`. We anticipate
retrieving all of the tabbed docs in reverse order of the last time they
were tabbed, so we add a `:tabbed_at` timestamp and index it.

**Listing** `db/migrate/[timestamp]_create_docs.rb`

<!-- language: lang-ruby -->
    class CreateDocs < ActiveRecord::Migration
      def change
        create_table :docs do |t|
          t.string :url
          t.datetime :tabbed_at
    
          t.timestamps
        end
        add_index :docs, :tabbed_at
      end
    end
    
First we'll create some minimal tests. In particular, we verify that a doc
object responds to the `url` and `tabbed_at` attributes:

**Listing** `spec/models/doc_spec.rb`

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
    
    end
    
We can get these tests to pass by running the docs
migration and preparing the test database:

    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    
Verify by running

    $ bundle exec rspec spec/models/doc_spec.rb
    
The resulting Doc model structure is shown here:

| docs       |          |
|------------|----------|
| id         | integer  |
| url        | string   |
| tabbed_at  | datetime |
| created_at | datetime |
| updated_at | datetime |

The code in the `before` block of `doc_spec.rb` is wrong, as indicated
by the comment. To see why, we will start with validation tests for the
Doc model.

**Listing** `spec/models/doc_spec.rb`

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
    
We can get this to pass with a simple presence validation:

**Listing** `app/models/doc.rb`


