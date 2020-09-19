# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  def self.types
    Dir[Rails.root.to_s + "/app/notifications/*.rb"].each { |file| require file }
    Noticed::Base.subclasses.collect { |type|
      name = type.name.underscore.split("_")[0..-2].join(" ").capitalize
      [type.name.to_sym, name]
    }.to_h
  end
end
