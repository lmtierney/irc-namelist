require 'sinatra'

class NamesApp < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, 80

    get '/' do
        file = File.open('names.txt', 'rb')
        file.read.gsub(',', '<br />')
    end

    post '/names' do
        File.open('names.txt', 'w') { |file| file.write(request.params['names']) }
        halt 200, 'success'
    end
end
