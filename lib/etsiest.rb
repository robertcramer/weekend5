require "etsiest/version"
require "sinatra/base"
require "etsy"

require "pry"

Etsy.api_key = ENV['ETSY_KEY']

module Etsiest
  class App < Sinatra::Base
    set :logging, true

    get "/" do

      data = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')
      data = data.result


      erb :index, locals: { items: data }

    end

    run! if app_file == $0
  end
end
