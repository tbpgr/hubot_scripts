# Description
#   Output empty lines
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ume N - Output N-empty-lines. If you omit N, lines set 15.
#
# Author:
#   tbpgr
module.exports = (robot) ->

  robot.respond /ume+( (\d+))?/i, (msg) ->
    lines = msg.match[2] || 15
    msg.send '' for [1..lines]
