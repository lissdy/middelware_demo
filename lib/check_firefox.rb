class CheckFirefox
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    if env["HTTP_USER_AGENT"] =~ /[^\(]*[^\)]*[^\t]Firefox\//
       [400, headers, response]
    else
       [status, headers, response]
    end
  end
end
