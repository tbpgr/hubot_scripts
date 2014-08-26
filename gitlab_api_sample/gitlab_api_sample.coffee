# Description
#   Output GitLab Users
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot gitlab users ... - Output gitlab users.
gitlab = (require 'gitlab')
  url:   'http://your_path'
  token: 'your_token'

module.exports = (robot) ->

  robot.respond /gitlab users/i, (msg) ->
    gitlab.users.all (users) ->
      msg.send "GitLab Users | id:#{user.id}: , name:#{user.name}" for user in users
