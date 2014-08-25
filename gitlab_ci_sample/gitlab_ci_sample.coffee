module.exports = (robot) ->
  say = (message) ->
    user = {
      room :
        id : 2
    }

    robot.send user, message

  robot.router.post "/gitlab_ci/hook", (req, res) ->
    json  = req.body
    say "GitLab CI complete"
    say "project_name = #{json['project_name']}"
    status = json['build_status']
    icon = if status == 'failed' then ':skull:' else ':angel:'
    say "#{icon} #{status}"
    say "branch = #{json['ref']}"
    say json['gitlab_url']

    res.send 200
