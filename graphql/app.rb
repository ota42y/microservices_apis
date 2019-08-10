# frozen_string_literal: true

require 'rack/contrib'

require 'sinatra/base'
require 'sinatra/json'

require_relative 'schema'

class MyApp < Sinatra::Base
  use Rack::PostBodyContentTypeParser

  set :bind, '0.0.0.0'

  post '/graphql' do
    result = Schema.execute(params[:query])
    json result
  end

  run! if app_file == $PROGRAM_NAME
end
