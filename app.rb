require 'sinatra'
require 'sinatra/cross_origin'
require 'net/telnet'
require 'wemo'
require 'wemo/switch'

configure do
  enable :cross_origin
end

def process_query(command)
  if command.scan(/turn on guest bedroom light/).length > 0
    print "Turning on guest bedroom lights...\n"
    netbooter = Net::Telnet::new("Host" => "192.168.1.11",
                                 "Timeout" => 10,
                                 "Prompt" => /[#>:]/n) { |resp| print "==> "+resp }
    # pass username and password as commands not .login method
    #netbooter.cmd("login") { |c| print c }
    #netbooter.cmd("admin") { |c| print c } 
    #netbooter.cmd("admin") { |c| print c }
    #netbooter.cmd("prsv 1") { |c| print c }
    netbooter.cmd("pset 1 1") { |c| print c }
    netbooter.close
  elsif command.scan(/turn off guest bedroom light/).length > 0
    print "Turning off guest bedroom lights...\n"
    netbooter = Net::Telnet::new("Host" => "192.168.1.11",
                                 "Timeout" => 10,
                                 "Prompt" => /[#>:]/n) { |resp| print "==> "+resp }
    # pass username and password as commands not .login method
    #netbooter.cmd("login") { |c| print c }
    #netbooter.cmd("admin") { |c| print c } 
    #netbooter.cmd("admin") { |c| print c }
    #netbooter.cmd("prsv 1") { |c| print c }
    netbooter.cmd("pset 1 0") { |c| print c }
    netbooter.close
  elsif command.scan(/turn on west bedroom light/).length > 0
    print "Turning on west bedroom lights...\n"
    netbooter = Net::Telnet::new("Host" => "192.168.1.13",
                                 "Timeout" => 10,
                                 "Prompt" => /[#>:]/n) { |resp| print "==> "+resp }
    # pass username and password as commands not .login method
    #netbooter.cmd("login") { |c| print c }
    #netbooter.cmd("admin") { |c| print c } 
    #netbooter.cmd("admin") { |c| print c }
    #netbooter.cmd("prsv 1") { |c| print c }
    netbooter.cmd("pset 1 1") { |c| print c }
    netbooter.close
  elsif command.scan(/turn off west bedroom light/).length > 0
    print "Turning off guest bedroom lights...\n"
    netbooter = Net::Telnet::new("Host" => "192.168.1.13",
                                 "Timeout" => 10,
                                 "Prompt" => /[#>:]/n) { |resp| print "==> "+resp }
    # pass username and password as commands not .login method
    #netbooter.cmd("login") { |c| print c }
    #netbooter.cmd("admin") { |c| print c } 
    #netbooter.cmd("admin") { |c| print c }
    #netbooter.cmd("prsv 1") { |c| print c }
    netbooter.cmd("pset 1 0") { |c| print c }
    netbooter.close
  elsif command.scan(/turn on playroom light/).length > 0
    print "Turning on playroom light...\n"
    #switch = Wemo::Switch.new("Playroom Spotlights")
    #switch.on
    #Wemo::Switch.send_command('Playroom Spotlights', 'on')
    #Wemo.on('Playroom Light')
  elsif command.scan(/turn off playroom light/).length > 0
    print "Turining off playroom light...\n"
    #switch = Wemo::Switch.new("Playroom Spotlights")
    #switch.off
    #Wemo::Switch.send_command('Playroom Spotlights', 'off')
    #Wemo.off('Playroom Light')
  elsif command.scan(/temperature/).length > 0
    print "temperature\n"
  elsif command.scan(/eva/).length > 0
    print "eva\n"
  elsif command.scan(/nico/).length > 0
    print "nico\n"
  else
    print "don't understand\n"
  end
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
