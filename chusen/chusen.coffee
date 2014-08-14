# Description
#   Choose User
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot chusen <name1> <name2> <name3> ... - Output chosen name at random.
#
# Author:
#   tbpgr
module.exports = (robot) ->

  robot.respond /chusen+ (.*)+/i, (msg) ->
    if msg.match.length == 0
      msg.send 'chusen に続けて抽選対象をスペース区切りで列挙してください'
      return null

    names = msg.match[1].split(' ')
    random_result = msg.random(names)
    msg.send "抽選結果！#{random_result}"