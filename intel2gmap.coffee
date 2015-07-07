# Description:
#   kikuta's Hubot script
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   None

intel2gmap = (msg, text) ->
  ll = if text.indexOf("pll=") > -1
    text.match(/pll=([\d\.,]+)/)[1]
  else
    text.match(/ll=([\d\.,]+)/)[1]
  return unless ll
  msg.send "https://www.google.co.jp/maps/@" + ll + ",16z"

gmap2intel = (msg, text) ->
  ll = text.match(/@([\d\.]+,[\d\.]+)/)[1]
  return unless ll
  msg.send "https://www.ingress.com/intel?ll=" + ll + "&z=16&pll=" + ll

module.exports = (robot) ->
  robot.hear /https?:\/\/www\.ingress\.com\/intel\?/i, (msg) ->
    intel2gmap msg, msg.message.text

  robot.hear /https:\/\/www\.google\.co\.jp\/maps\/@/i, (msg) ->
    gmap2intel msg, msg.message.text
