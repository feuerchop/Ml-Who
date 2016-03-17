# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'sqlite3'

db = SQLite3::Database.new "db/AIAcademicBase.sqlite3"

db.execute("select * from icml_authors") do |row|
   name = row[0]
   author = MlAuthor.find_by(name: name)
   if author == nil
      # new record
      MlAuthor.create({name: row[0],
                       affiliation: row[1],
                       country: row[2],
                       email: row[3],
                       n_appeared: row[4]})
  else
     puts author.name,' is found.. '
     author.update({n_appeared: author.n_appeared + row[4]})
  end
end

db.execute("select * from nips_authors") do |row|
     name = row[0]
     author = MlAuthor.find_by(name: name)
     if author == nil
        # new record
        MlAuthor.create({name: row[0],
                         affiliation: row[1],
                         country: row[2],
                         email: row[3],
                         n_appeared: row[4]})
    else
       puts author.name,' is found.. '
       author.update({n_appeared: author.n_appeared + row[4]})
    end
end
