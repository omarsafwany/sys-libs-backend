class Package < ActiveRecord::Base
    validates :name, presence: true
    validates :os, presence: true
    validates_uniqueness_of :name, :scope => :os
end
