class Case < ApplicationRecord
  self.primary_key = 'id'
  self.table_name = 'case'

  include PgSearch
  pg_search_scope :search_for_case_data, against: %i(id)
end
