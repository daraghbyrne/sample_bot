require 'sinatra'
require "sinatra/reloader" if development?


enable :sessions
greetings = ["Howdy, partner ", "Whattup homie ", "Aloha ", "Hi there "]




get "/" do
	"Hello world"
end

get '/about' do
    if session["first_name"].nil?
        'Welcome!'
      else
        'Welcome back ' + session["first_name"]
    end
    time = Time.new( 2017, 10, 01, 2, 2, 2) # returns the time on Oct 1st 2017 at 02:02:02 AM
    # time = puts time_format.strftime("%A %B %d, %Y %H:%M")
    session["visits"] ||= 0 # Set the session to 0 if it hasn't been set before
    session["visits"] = session["visits"] + 1  # adds one to the current value (increments)
    # greetings.sample
    greetings.sample + '<br/> DJam bot recommends the best sing-a-long songs for you to rock out to with your friends! You have visitied ' + session["visits"].to_s + ' times as of ' + time.strftime("%B %d, %Y %H:%M").to_s
end


get '/signup' do
    'To jam out with this bot, text "groovy baby" to 1234'
end

get '/incoming/sms' do
    "Blank message"
end

# get '/test/conversation' do
#     "Blank message"
# end

get '/' do
    redirect to('/about')
end


# get '/' do
#     # if the session variable value contains a value
#       # display it in the root endpoint
#     "first_name = " << session[:first_name].inspect
# end
  
# get '/signup/:first_name' do
#     # store a parameter in a session
#     session['first_name'] = params['first_name']
# end

# get '/' do
#     # if the session variable value contains a value
#       # display it in the root endpoint
#     "number= " << session[:number].inspect
# end
  
# get '/:number' do
#     # store a parameter in a session
#     session['number'] = params['number']
# end


get '/signup/:first_name/:number' do
    session['first_name'] = params['first_name']
    session['number'] = params['number']
    'Hey there,' + params['first_name'] + '. We are saving your number:' + params['number'] + ' on our mixtape.'
end


get '/incoming/sms' do
    403
end 

get '/test/conversation' do
    return determine_response params[:Body]
    # if session["first_name"].nil?
    #     return 'Welcome!'
    #   else
    #     return 'Welcome back ' + session["first_name"]
    # end

    # if session["number"].nil?
    #     return 'Please provide your contact number'
    #   else
    #     return 'What can I help you with today?'
    # end
    

end 

def determine_response body
    body = params[:Body].to_s
    body = body.downcase.strip 
    if body== 'hi'
        return 'Hello there!'
    elsif body == 'who'
        return 'This is DJam bot!'
    elsif body == 'what'
        return 'DJam bot recommends the best sing-a-long songs for you to rock out to with your friends!'
    elsif body == 'where'
        return 'Yinz can find me in Pittsburgh'
    elsif body == 'when'
        return 'Been mixing since Spring 2020'
    elsif body == 'why'
        return 'I was orchestrated for a cool class project'
    elsif body == 'joke'
        array_of_lines = IO.readlines("jokes.txt")
        return array_of_lines.sample
    elsif body == 'fact'
        array_of_facts = IO.readlines("facts.txt")
        return array_of_facts.sample
    end
end

def varying_inputs content
    content = params[:Body]
    content = content.downcase.strip 
    content_options = []
    content.each do |content|
        puts content.to_s
        if str.include? 'feature'
            content_options.push 
        end
    end
end
 
error 403 do
   "Access forbidden"
end

