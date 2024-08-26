#!/usr/bin/env ruby

begin
  project = ARGV[0]
  server = ARGV[1]

  if project.nil?
    raise "<project> not specified"
  end
  if server.nil?
    raise "<server> not specified"
  end

  `git clone --bare ./#{project} #{project}.git`
  `scp -r #{project}.git #{server}:#{project}.git`
  `rm -rf #{project}.git`
  `cd #{project} && git remote add origin #{server}:#{project}.git && git push --set-upstream origin main`
  print("")
  print("Now check that your user has access rights in the server, repositorio exist and that git is installed.")
rescue StandardError => e 
  STDERR.puts("Error #{e.message}. (Run this script from the project parent directory)\n\n. Usage: remotize.rb <project> <server>")
end
