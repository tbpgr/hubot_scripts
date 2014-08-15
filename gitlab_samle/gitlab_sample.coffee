module.exports = (robot) ->
  say = (message) ->
    # hubot-kandan が room を id 指定する前提になっていてつらい。
    # name にして欲しい。
    user = {
      room :
        id : 2
    }

    robot.send user, message

  issue = (json) ->
    say "GitLab issue"
    say "json['object_attributes']['title'] = #{json['object_attributes']['title']}"
    say "json['object_attributes']['description'] = #{json['object_attributes']['description']}"

  merge_request = (json) ->
    say "GitLab merge_request"
    say "json['object_attributes']['target_branch'] = #{json['object_attributes']['target_branch']}"
    say "json['object_attributes']['title'] = #{json['object_attributes']['title']}"
    say "json['object_attributes']['state'] = #{json['object_attributes']['state']}"

  push = (json) ->
    say "GitLab push"
    say "json['repository.name'] = #{json['repository']['name']}"
    say "json['commits'][0]['message'] = #{json['commits'][0]['message']}"

  robot.router.post "/gitlab/hook", (req, res) ->
    json  = req.body
    # 全ての json が持つ共通の属性がないので object_kind で判断
    # push だけは object_kind を持っていないので擬似的に "push " を設定
    #
    # issue         => GitLabのjson object_kind: issue
    # merge_request => GitLabのjson object_kind: merge_request
    # push          => GitLabのjson object_kind: ない
    event = json['object_kind'] || 'push'

    switch event
      when "issue" then issue json
      when "merge_request" then merge_request json
      when "push" then push json

    res.send 200
