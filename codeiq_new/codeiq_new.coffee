# Description
#   Output CodeIQ new problem.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot codeiq new_N ... - Output a codeiq new problem
#   hubot codeiq new_all ... - Output codeiq all new problems
#
# Author:
#   tbpgr
xml2js = require('xml2js')
parseXML = xml2js.parseString
module.exports = (robot) ->

  robot.respond /codeiq new_(\d+)$/i, (msg) ->
    qno = parseInt(msg.match[1])
    robot.http("https://codeiq.jp/rss.xml")
      .get() (err, res, body) ->
        parseXML body, (err, xml) ->
          qs = xml.rss.channel[0].item
          qno = qs.length if qno > qs.length
          qno = 1 if qno = 0
          q = qs[qno - 1]
          msg.send "no = #{qno}"
          msg.send "title = #{q.title}"
          msg.send "url = #{q.link}"
          msg.send "description = #{q.description}"
          msg.send "author = #{q.category}"

  robot.respond /codeiq new_all$/i, (msg) ->
    robot.http("https://codeiq.jp/rss.xml")
      .get() (err, res, body) ->
        parseXML body, (err, xml) ->
          xml.rss.channel[0].item.forEach (q, i) ->
            msg.send "no = #{i + 1}| #{q.title}"
