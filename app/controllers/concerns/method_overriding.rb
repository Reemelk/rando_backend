module MethodOverriding
  extend ActiveSupport::Concern

  def render(options)
    self.content_type = 'application/json'
    body = Oj.dump(options[:json], mode: :compat)
    self.response_body = body
  end
end
