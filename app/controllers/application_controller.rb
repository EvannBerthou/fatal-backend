class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  wrap_parameters format: []
end
