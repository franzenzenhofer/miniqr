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
 
## people stuff
me, <a href="http://www.franz-enzenhofer.com/">Franz Enzenhofer</a>, follow me **not** on <a href="https://twitter.com/enzenhofer">twitter</a>.

oh, by the way, i'm at <a href="http://2012.lxjs.org/">LXJS 2012</a> and <a href="http://fronteers.nl/congres/2012">fronteers 2012</a>, talk to me!

##MIT LICENSE 

Copyright (c) 2012 Franz Enzenhofer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

##what else?
<img src="http://img.skitch.com/20100530-pay843me9dnyiuibede6sd86d4.png" alt="mind the whitespace"> the white space is a mandatory part of the QRcode!!!
 