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
    robot.http("https://qiita.com/api/v1/items")
      .get() (err, res, body) ->
        articles = JSON.parse(body)
        article = msg.random(articles)
        msg.send "title:#{article['title']}"
        msg.send "url => "
        msg.send article['url']
        msg.send "author:#{article['user']['url_name']}"
