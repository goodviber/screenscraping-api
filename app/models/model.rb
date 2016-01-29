class Model < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types

  validates :name, presence: true, uniqueness: true

  before_create do
    self.slug = name.downcase.gsub(" ", "-")
  end

  def to_param
    slug
  end

  def as_json(options={})
    super(:only => [:name],
      :include => {
        :model_types => {:only => [:name, :base_price]}
      }
    )
  end
end
