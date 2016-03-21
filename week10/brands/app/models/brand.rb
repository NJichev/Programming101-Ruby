class Brand < ActiveRecord::Base
  scope :range, -> (first, final) do
    Brand.where(:id => first.to_i+1..(final.to_i+first.to_i))
  end
end
