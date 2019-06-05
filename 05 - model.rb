# == Schema Information ##From annotate gem
#
# Table name: migrations
#
#  id         :bigint           not null, primary key
#  foreign_key :integer          not null
#  string     :string
#  paragraph  :text
#  number     :float
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Model < ApplicationRecord ##two foreign keys allow Model to be used as a Join table.(One Model per purpose. Don't put too much data in a 'Join Table' Model)
  validates :value, presence: true, uniqueness: true, inclusion: {SOMECOLLECTION}  ##default validations ask Ryan for more
  validate :value_validation ###custom validation. See method at bottom

  belongs_to :some_plural_model, ##snake_case
    foreign_key: :foreign_key, ##From here
    class_name: :Model ##singular. CamelCase

  has_many :some_other_plural_model,
    foreign_key: :foreign_key, ##From other model
    class_name: :Model

  has_one :some_singular_model, ##has one. 1:1 instead of Many-one. 
    through: :some_other_plural_model, ##association we are using in this Model
    source: :AnotherModel ##assosiation method being called in source Model
    

  def value_validation   ###Custom Validation Method. Shovel errors into :body
    if ##Value Logic when to error out
      errors[:value] << "error message" ##shovel error message into errors[:value]
    end
  end
end
