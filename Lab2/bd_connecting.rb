#!/usr/bin/ruby -w
#require_relative 'C:\Ruby32-x64\lib\ruby\gems\3.2.0\gems\mysql2-0.5.5\lib\mysql2.rb'
require 'mysql2'

client = Mysql2::Client.new(
  :host => '127.0.0.1',
  :username => 'root',
  :password => '1234',
  :database => 'student',
  :encoding => 'utf8'
)

results = client.query("select * from student where id = 3", :as => :hash)
results.each do |row|
  puts row.class
end


