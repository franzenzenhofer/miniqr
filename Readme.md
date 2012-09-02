#Miniqr.reader()

Miniqr.reader() is a
  
  * simple
  * browser based
  * 100% client side 
  * written in CoffeeScript/JS
  * <b>QRcode</b> reader
  * that takes your webcam as the input
  
##what does it do
basically it accesses the useres webcam, if the users hold a QRcode in front of the webcam, the data gets decoded.

or, just try it <b><a href="http://miniqr.com/docs/demo/">http://miniqr.com/docs/demo/</a></b> (note: you need a QRcode in your hand, you can make one at <a href="http://miniqr.com/">miniqr</a>)


##how to use it

you call it like this  
 `Miniqr.reader(videoSuccess, videoError, qrSuccess, qrError[, options])`
 
it uses these callbacks

`videoSuccess(video, stream)`

after you have access to the users webcam, this function is called, it  gives you access to the webcams `<video>`, and if you want to go low-leve, the `stream` mediaobject of the webcam input.

`videoError(error)` is called if you don't get access to the webcam of one reason or the other (i.e.: if the users doesn't hat a webcam or denies you access to it)

`qrSuccess(data)` gives you access to the successfully decoded date from the QRcode.

`qrError(error)` whenever you do not decode a QRcode from the video (i.e: if there is just nobody holding a QR code int the camera) then this callback is called. note: as, most of the time, there is no QRcode in front of the camera, just use `() ->` 

Miniqr.reader() has currently 2 dependencies

 * <a href="https://github.com/franzenzenhofer/Sinne">https://github.com/franzenzenhofer/Sinne</a>
 * <a href="https://github.com/franzenzenhofer/jsqrcode">https://github.com/franzenzenhofer/jsqrcode</a> - my fork of jsqrcode
 