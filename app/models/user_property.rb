class UserProperty < ActiveRecord::Base
  self.primary_key = 'id'
  self.table_name = 'user_property'
  include PgSearch
  pg_search_scope :search_for_case_id, against: %i(caseId)
  pg_search_scope :search_for_userId, against: %i(userId)
end
