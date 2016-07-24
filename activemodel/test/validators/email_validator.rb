require 'active_support/core_ext/regexp'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not an email") unless
      /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.match?(value)
  end
end
