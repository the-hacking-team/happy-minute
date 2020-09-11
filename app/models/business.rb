# frozen_string_literal: true

class Business < ApplicationRecord
  belongs_to :owner
  has_many :items
  has_many :business_follows
  has_many :customers, through: :business_follows
  has_one_attached :business_photo
end
