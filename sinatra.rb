require 'sinatra'
require 'sinatra/reloader' if  development?
require 'net/http'

TIMETABLE_API_CALL = "http://82.207.107.126:13541/SimpleRIDE/LAD/SM.WebApi/api/stops/?code="

get '/' do
  erb  :form
end

#get '/:code' do
#  "#{code}"
#end

post '/' do
  code = "%04d" % params[:code]
  get_bus_results(code)
end

def get_bus_results(code)
  url = URI.parse(TIMETABLE_API_CALL+code)
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }

  require 'pry'; binding.pry()

  puts res.body
end


__END__
@@form
<form method=post>
  <input type='text' name='code'>
</form>

@@layout
<html>
<head>
  <title>
    LALALA
  </title>
</head>
<body>
  <%= yield %>
</body>
</html>
