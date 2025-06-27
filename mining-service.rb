#!/usr/bin/ruby
# start stop mining services

require 'net/ssh'

# Validate command-line argument
if ARGV.length != 1 || !%w[start stop].include?(ARGV[0])
  puts "Usage: #{$PROGRAM_NAME} <start|stop>"
  exit 1
end

command = ARGV[0]

# Define the list of remote machines and their credentials
remote_machines = [
  { host: 'mac-mini.local', user: 'danielvela', path: '/Users/danielvela/projects/xmrig-6.22.2' },
  { host: 'micro-atx.local', user: 'danielvela', path: '/home/danielvela/services/xmrig-6.22.2' },
  # Add more machines as needed
]

# Define the script to run based on the command
script = "xmrig-#{command}.sh"

remote_machines.each do |machine|
  Net::SSH.start(machine[:host], machine[:user]) do |ssh|
    puts "Executing #{script} on #{machine[:host]}..."
    script_path = File.join(machine[:path], script)
    output = ssh.exec!("if [ -x #{script_path} ]; then #{script_path}; else echo '#{script_path} not found or not executable'; fi")
    puts output
  end
end
