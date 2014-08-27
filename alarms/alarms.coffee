# Description
#   Set cronjobs for event alarms( work start/end, lunch start/end )
#
# Dependencies:
#   None
#
# Configuration:
#   None
cronJob = require('cron').CronJob

module.exports = (robot) ->
  say = (message) ->
    user = {
      room :
        id : 6 # Other
    }

    robot.send user, message

  cronjob1 = new cronJob('00 9 * * 1-5', () =>
    say ":sunrise: おはようございます。始業ですよ"
  )
  cronjob1.start()
  cronjob2 = new cronJob('00 12 * * 1-5', () =>
    say ":bento: お昼休みです"
  )
  cronjob2.start()
  cronjob3 = new cronJob('00 13 * * 1-5', () =>
    say ":clock1: お昼休みが終わりました"
  )
  cronjob3.start()
  cronjob4 = new cronJob('00 18 * * 1-5', () =>
    say ":stars: お疲れ様です。終業ですよ"
  )
  cronjob4.start()
