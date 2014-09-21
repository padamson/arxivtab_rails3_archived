# Regenerating the development database

Make sure `config/database.yml` is present. Mike Hartl recommends adding it
to the `.gitignore` file, so you may have to dig one up. I've removed it
from `.gitignore`. 

There are a couple of different ways to recreate or reset your database in 
Ruby. The first will simply re-initialize your database and will also reload 
your schema. Do this with the following:

`$ rake db:reset`

`$ rake db:migrate`

The second way will actually drop your database and recreate it using your 
migration scripts.  This is done with the following commands:

`$ rake db:drop`

`$ rake db:create`

`$ rake db:migrate`

Both of these methods are equally destructive in their own right.  Both will 
result in complete data loss.

The *Ruby on Rails Tutorial, 2nd Edition,* includes code to generate sample 
users and microposts:


`$ bundle exec rake db:reset`

`$ bundle exec rake db:populate`

`$ bundle exec rake db:test:prepare`

You can explore the database using the `sqlitebrowser` utility app.
