#has dependency to window.Sinne object https://github.com/franzenzenhofer/Sinne.git
#has dependecy to window.qrcode object https://github.com/franzenzenhofer/jsqrcode
Miniqr = {}

Miniqr.errorCallback = (e) -> #ignore all QR errors, as error handling is shit in the qrcode lib reuse

Miniqr.callback = qrcode.callback = (data) -> 
 if data 
   console?.log?(data)
 else 
  Miniqr.errorCallback(data)
  
scan  = (video, canvas, ctx, options) ->
  #console.log('scan action')
  ctx.restore()
  ctx.drawImage(video,0,0,canvas.width, canvas.height)
  try 
    #normal scan
    qrcode.decode(canvas)
  catch e
    if e.toString() is "Couldn't find enough finder patterns" 
    else
      #mirror
      ctx.restore()  
      ctx.translate(canvas.width,0)
      ctx.scale(-1, 1)
      try
        qrcode.decode(canvas)
      catch e2
        #flip
        ctx.restore()
        ctx.rotate(Math.PI)
        ctx.drawImage(canvas,canvas.width*-1,canvas.height*-1)
        try
          qrcode.decode(canvas)
        catch e3
          Miniqr.errorCallback(e3)
        finally
          ctx.rotate(Math.PI)
  if(options.scanloop is true)        
    window.setTimeout((()->scan(video, canvas, ctx, options)), (1000/options.fps))
  
#videoError = (error) -> console.log(error)

#videoPreSuccess = (video, stream) ->
#  $('#video_placeholder').html(video)
#  canvas  = $('#qr-canvas').get(0)
#  ctx = canvas.getContext('2d')
#  ctx.save()
#  scan(video, canvas, ctx)
#Sinne.getUserVideo(videoSuccess, videoError, {width: 320, height: 240})
 
#qrcode.decode()
Miniqr.reader = (videoSuccess, videoError, qrSuccess, qrError, options) ->
  canvas  = document.createElement('canvas')
  ctx = canvas.getContext('2d')
  ctx.save()
  
  default_options =
    fps: 10
    scanloop: true
    width: 320
    height: 240
    controls: false
  #merge options with default options
  options_ = {}
  options_[key] = val for key, val of default_options
  options_[key] = val for key, val of options
  options = options_
  
  Miniqr.callback= qrcode.callback = qrSuccess if qrSuccess?
  Miniqr.errorCallback = qrError if qrError?
  
  videoPreSuccess = (video, stream) ->
    #console.log(options)
    scan(video, canvas, ctx, options)
    videoSuccess(video, stream)
  Sinne.getUserVideo(videoPreSuccess, videoError, options)
  
#export Miniqr
window.Miniqr = Miniqr
  
  