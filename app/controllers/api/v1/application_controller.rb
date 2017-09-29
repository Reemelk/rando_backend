class Api::V1::ApplicationController < ActionController::Metal
  include DefaultSettings
  include AuthRequest
end
