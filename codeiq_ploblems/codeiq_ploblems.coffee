module.exports = (robot) ->
  deathmas = [
    "https://codeiq.jp/ace/tbpgr/q791",
    "https://codeiq.jp/ace/tbpgr_colosseum_manager/q835",
    "https://codeiq.jp/ace/tbpgr_colosseum_manager/q872",
    "https://codeiq.jp/ace/tbpgr_colosseum_manager/q915",
    "https://codeiq.jp/ace/tbpgr_colosseum_manager/q969"
  ]

  robot.respond /deathma(\d+)/i, (msg) ->
    deathma_no = parseInt(msg.match[1]) - 1
    if deathma_no >= deathmas.length
      return msg.send "no deathma"
    msg.send deathmas[deathma_no]

  robot.respond /deathma\?/i, (msg) ->
    msg.send deathmas[deathmas.length - 1]

  robot.hear /^山川$/i, (msg) ->
    msg.send "豊（稲中参照）"
