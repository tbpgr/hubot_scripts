# Description
#   Output daytopic
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot daytopic <MMDD> dekigoto... - Output daytopic dekigoto
#   hubot daytopic <MMDD> tanjyoubi... - Output daytopic tanjyoubi
#   hubot daytopic <MMDD> imibi... - Output daytopic imibi
#   hubot daytopic <MMDD> kinenbi... - Output daytopic kinenbi
xml2js = require('xml2js')
parseXML = xml2js.parseString
module.exports = (robot) ->
  robot.respond /daytopic (\d{4}){1} (.*)$/i, (msg) ->
    month_day = msg.match[1]
    category = msg.match[2]
    if (['dekigoto', 'tanjyoubi', 'imibi', 'kinenbi'].indexOf(category) < 0)
        category = 'dekigoto'

    robot.http("http://www.mizunotomoaki.com/wikipedia_daytopic/api.cgi/#{month_day}")
      .get() (err, res, body) ->
        parseXML body, (err, xml) ->
          title = xml.feed.title
          wikipedia = xml.feed.wikipedia
          items = xml.feed[category][0].item
          item = msg.random(items)
          msg.send "title = #{title}"
          msg.send "#{category} = #{item}"
          msg.send wikipedia
