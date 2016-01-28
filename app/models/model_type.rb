class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :name, presence: true, uniqueness: true

  before_create do
    self.slug = name.downcase.gsub(" ", "-")
  end

  def to_param
    slug
  end
end
