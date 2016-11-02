module.exports = (logstashUrl) -> (events) ->
  console.log "TestX logstash logger logging at #{logstashUrl}"
  events.on 'test:start', (script, ctx) ->
    console.log script, ctx
