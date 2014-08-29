# Description
#   Output photozou
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot photozou <query>... - Output photozou
module.exports = (robot) ->
  robot.respond /photozou( (.*))/i, (msg) ->
    query = msg.match[2]
    robot.http("https://api.photozou.jp/rest/search_public.json?keyword=#{query}&limit=10")
      .get() (err, res, body) ->
        photos = JSON.parse(body)['info']['photo']
        photo = msg.random(photos)
        msg.send "title:#{photo['photo_title']}"
        msg.send "image_url => "
        msg.send photo['image_url']
