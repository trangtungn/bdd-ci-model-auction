class User < ApplicationRecord
  validates_presence_of %i[password email]
end
