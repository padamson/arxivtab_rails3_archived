# Docs Controller

First, we'll use `generate` to make the simplest controller that meets our
present needs for a Docs controller--one with a stub 'Add Document' page
to add a document for future tabbing. Following the conventional REST
architecture favored by Rails, we'll call the action for new docs `new` and
pass it as an argument to `generate controller` to create it automatically.

**Listing** Generating a Docs controller (with a `new` action)
    $ rails generate controller Docs new --no-test-framework
    
**Listing** Initial Docs controller, with a `new` action.
    `app/controllers/docs_controller.rb`

    class DocsController < ApplicationController
      def new
      end
    end
    
**Listing** The initial `new` action for Docs.
    `app/views/docs/new.html.erb`
    
    <h1>Docs#new</h1>
    <p>Find me in app/views/docs/new.html.erb</p>

With this code, we have a working page for new docs at /docs/new.
We'll generate some integration tests and develop them:
    `$ rails generate integration_test doc_pages`
    
This results in an initial spec file `spec/requests/doc_pages_spec.rb`
which we will modify. Here's a first cut that checks for contents of the `h1`
and `title` tags.

**Listing** Initial integration test spec for docs, with a test for the
new docs page.
    `spec/requests/doc_pages_spec.rb`
    
    require 'spec_helper'
    
    describe "Doc pages" do
    
      subject { page }
      
      describe "docs#new" do
        before { visit docs_new_path }
    
        it { should have_content('Add document') }
        it { should have_title(full_title('Add document')) }
      end
    end
    
To get the tests to pass, all we need is a view with the title and heading 
"Add document":

**Listing** The initial (stub) add doc page.
    `app/views/docs/new.html.erb`
    
    <% provide(:title, 'Add document') %>
    <h1>Add document</h1>
    <p>Find me in app/views/docs/new.html.erb</p>
    
We need to be able to get to this page, so we'll add a button to
the home page (when a user is signed in) below the micropost form
(below the section with `<%= render 'shared/micropost_form' %>`

**Listing** Code snippet to add a button to get to the 'Add
document' page.

    <section>
      <%= link_to "Add document",
                  docs_new_path,
                  class: "btn btn-large btn-primary" %>
    </section>
    

