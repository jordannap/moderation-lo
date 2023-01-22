class ModeratedModel < ApplicationRecord
  include Moderable
  after_create :status?
end
