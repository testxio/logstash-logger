Logstash = require 'logstash-client'
uuid = require 'uuid'

module.exports = (logstashUrl) -> (events) ->
  console.log "TestX logstash logger logging at #{logstashUrl}"

  logstash = new Logstash(
    type: 'udp'
    host: (logstashUrl.split ':')[0]
    port: (logstashUrl.split ':')[1]
  )

  events.on 'step:start',  (step) ->
    sendToLogstash logstash, step

sendToLogstash = (logstash, message) ->
  meta =
    id: 'test'
  logstash.send message, (err, res) ->
    console.error err if err
    console.log res
