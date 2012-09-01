qrcode.callback = (data) -> alert(data)

copyToCanvas  = (video, canvas, ctx) ->
  #ctx = canvas.getContext('2d')
  ctx.restore()
  ctx.drawImage(video,0,0,canvas.width, canvas.height)
  try 
    #qrcode.decode()
    #qrcode.process(ctx)
    #console.log('normal')
    qrcode.decode()
    #qrcode.decode
  catch e
    #console.log(e)
    if e.toString() is "Couldn't find enough finder patterns" 
      #console.log('nothing found: '+e)
    else
      #mirror
      ctx.restore()  
      ctx.translate(canvas.width,0)
      ctx.scale(-1, 1)
      #ctx.drawImage(canvas,(c.width / 2)*-1,0)
      try
        #console.log('mirror')
        qrcode.decode()
      catch e2
        #console.log(e2)
        ctx.restore()
        ctx.rotate(Math.PI)
        ctx.drawImage(canvas,canvas.width*-1,canvas.height*-1)
        try
          #console.log('flip')
          qrcode.decode()
        catch e3
          #console.log(e3)
        finally
          ctx.rotate(Math.PI)
          
  window.setTimeout((()->copyToCanvas(video, canvas, ctx)), (1000/10))
  
videoError = (error) -> console.log(error)

videoSuccess = (video, stream) ->
  $('#video_placeholder').html(video)
  canvas  = $('#qr-canvas').get(0)
  ctx = canvas.getContext('2d')
  ctx.save()
  copyToCanvas(video, canvas, ctx)
Sinne.getUserVideo(videoSuccess, videoError, {width: 640, height: 480})

#qrcode.decode()