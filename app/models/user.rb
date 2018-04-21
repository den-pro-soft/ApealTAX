class User < ActiveRecord::Base
  self.primary_key = 'id'
  self.table_name = 'user'
  include PgSearch
  pg_search_scope :search_for_userId, against: %i(userId)
end
