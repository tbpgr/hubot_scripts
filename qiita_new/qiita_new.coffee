# Description
#   Output Qiita new article(random).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot qiita new ... - Output qiita new article(random)
#
# Author:
#   tbpgr
module.exports = (robot) ->

  robot.respond /qiita new/i, (msg) ->
    msg.http('http://qiita.com/api/v1/items')
      .query('')
      .get(err, res, body) ->
        articles = JSON.parse(body)
        msg.send articles
