class Property < ActiveRecord::Base

  self.primary_key = 'id'
  self.table_name = 'property'

  include PgSearch

  pg_search_scope :search_for_fulladdress, against: %i(fulladdress)
  pg_search_scope :search_for_pin, against: %i(pin)
  pg_search_scope :search_for_id, against: %i(id)
end