require "sinatra"
require "sinatra/reloader"
$history = []

get "/" do

  erb(:index, {layout: :default})
end

post "/" do
  puts params
  @val1 = params[:val1].to_f
  @val2 = params[:val2].to_f
  @operation = params[:operation]

  if @operation == "1"
    @total = @val1 + @val2
    $history << "#{@val1} + #{@val2} = #{@total}"
  elsif @operation == "2"
    @total = @val1 - @val2
    $history << "#{@val1} - #{@val2} = #{@total}"
  elsif @operation == "3"
    @total = @val1 % @val2
    $history << "#{@val1} % #{@val2} = #{@total}"
  elsif @operation == "4"
    @total = @val1 / @val2
    $history << "#{@val1} / #{@val2} = #{@total}"
  elsif @operation == "5"
    @total = @val1 * @val2
    $history << "#{@val1} x #{@val2} = #{@total}"
  end

  erb(:index, {layout: :default})
end

get '/history' do
  erb :history, layout: :default
end
