BufferStream = require('./buffer-stream')

class PostBuffer
    constructor: (req) ->
        @callback = null
        @got_all_data = no
        @stream = new BufferStream(size:'flexible')
        req.pipe(@stream)
        req.on 'end', =>
            @got_all_data = yes
            @callback?(@stream.buffer)

    onEnd: (@callback) =>
        @callback(@stream.buffer) if @got_all_data

# exports

module.exports = PostBuffer
