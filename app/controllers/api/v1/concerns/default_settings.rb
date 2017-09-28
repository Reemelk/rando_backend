module DefaultSettings
  extend ActiveSupport::Concern

  included do
    include AbstractController::Callbacks
    include ActionController::RackDelegation
    include ActionController::StrongParameters
  end
end
