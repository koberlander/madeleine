class Article < ApplicationRecord
  has_many :article_keywords
  has_many :keywords, through: :article_keywords
end


# SAMPLE 1
# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end
#
# class Person < ApplicationRecord
#   validates :email, presence: true, email: true
# end

# SAMPLE 2
# class Invoice < ApplicationRecord
#   validate :expiration_date_cannot_be_in_the_past,
#     :discount_cannot_be_greater_than_total_value
#
#   def expiration_date_cannot_be_in_the_past
#     if expiration_date.present? && expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
#   end
#
#   def discount_cannot_be_greater_than_total_value
#     if discount > total_value
#       errors.add(:discount, "can't be greater than total value")
#     end
#   end
# end
