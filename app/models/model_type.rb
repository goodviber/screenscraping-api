class ModelType < ActiveRecord::Base
  include Pricing
  belongs_to :model

  validates :name, presence: true, uniqueness: true

  before_create do
    self.slug = name.downcase.gsub(" ", "-")
  end

  def to_param
    slug
  end

  def total_price base_price = nil
		base_price = base_price || self.base_price
		policy = self.model.organization.pricing_policy
		Pricing.pricing_calc policy, base_price
	end

  def as_json(options={})
    return_json = super
    if options.has_key? :base_price
      price = self.total_price(options[:base_price]).to_s
      return_json[:total_price] = price
    end
    return return_json
  end
end
