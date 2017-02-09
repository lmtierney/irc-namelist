require 'sinatra'

class NamesApp < Sinatra::Base
    FILENAME = 'names.txt'

    set :bind, '0.0.0.0'
    set :port, 80

    get '/' do
        return 'No namelist found, try again in a minute.' unless File.exists? FILENAME
        file = File.open(FILENAME, 'rb')
        file.read.gsub(',', '<br />')
    end

    post '/names' do
        File.open(FILENAME, 'w') { |file| file.write(request.params['names']) }
        halt 200, 'success'
    end
end
