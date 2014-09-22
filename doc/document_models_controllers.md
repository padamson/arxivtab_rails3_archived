# Annotate Models

We will annotate or models using the `annotate` gem: 

1. add  `gem 'annotate', '~> 2.4.1.beta'` to `group :development` block
in the `Gemfile`
2. `$ bundle install`
3. `$ bundle exec annotate --position before`

This adds schema info at the beginning of the model files.

# Generate UML Diagrams for Models and Controllers

1. `sudo port install graphviz
2. `sudo gem install railroady
3. `cd my_rails_project
4. Add `gem railroady` to `group :development` block in Gemfile.
5. `$ rake diagram:all`

Now you have two different versions ("brief" and "complete") of
UML diagrams (`svg` files) for both your Models
and Controllers in the `doc` folder. You just have to repeat step 5 to
update the graphics.