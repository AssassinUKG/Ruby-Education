#!/usr/bin/ruby -w
require 'net/http'
require 'json'


#* means take the rest of the args
# arg1, arg2, *restArgs

if ARGV.length < 2
    puts "Too few arguments"
    exit
end

if ARGV[0] == '-u'
    $url1 = ARGV[1]
    puts "#{$url1}"
end

def getPage
    system("clear")
    uri = URI($url1)
    res = Net::HTTP.get_response(uri)
    if (res.code == '200')
        puts "Request completed: 200"
    end
    return JSON.parse(res.body)
end

flag=ARGV[0]
if (flag == '-u')
    r = getPage
    puts "flag: #{flag}"
    puts r
else
    puts "-u not found in command"
end
