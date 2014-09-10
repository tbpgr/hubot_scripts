# Description
#   Output external command
#
# Dependencies:
#   None
#
# Configuration:
#   None
child_process = require 'child_process'

module.exports = (robot) ->
  say = (message) ->
    user = {
      room :
        id : 6 # Other
    }

    robot.send user, message

  robot.respond /date/i, (msg) ->
    child_process.exec "date \/T", (error, stdout, stderr) ->
      if !error
        output = stdout+''
        say output
      else
        say "error"
