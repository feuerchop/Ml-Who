class MlAuthor < ActiveRecord::Base
   validates :name, presence: true,
                    length: {in: 3..100,
                             too_long: "100 characters is the maximum allowed.",
                             too_short: "We believe the minimum number of
                                 characters for Author name is 3." },
                    uniqueness: {case_sensitive: false},
                    on: :create
   validates :n_appeared, numericality: {only_integer: true,
                                         greater_than: 0}
   validates :affiliation, :country, length: {maximum: 255}

   def self.search(keywords)
      if keywords
         # byebug
         where(['name LIKE ? COLLATE NOCASE', "%#{keywords}%"])
      else
         all
      end
   end

end
