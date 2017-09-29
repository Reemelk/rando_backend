module RenderMethodOverriding
  def render(options)
    self.status = options[:status] || 200
    self.content_type = 'application/json'
    body = Oj.dump(options[:json], mode: :compat)
    self.response_body = body
  end
end
