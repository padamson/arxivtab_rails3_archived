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

