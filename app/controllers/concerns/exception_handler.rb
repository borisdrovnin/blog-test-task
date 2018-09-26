module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  UNPROCESSABLE_ERRORS = [
    JSON::Schema::ValidationError,
    ActiveRecord::RecordInvalid,
    ActiveModel::UnknownAttributeError
  ]

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from *UNPROCESSABLE_ERRORS do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end