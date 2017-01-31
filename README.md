# Telescope


Pixel-level graphics over TCP.

Slow? For now (read: yes). Strange? Certainly. Easy as shit? Yup.

The whole idea is that you have to do everything. Nothing is given to you excet the bare minimum. No drawing functions, just individual pixels. No fancy input settings, just a steam of input from the user.

## About

Serisouly though, why on earth would someone write something like this? It is a weird concept, especially considering I designed it to be used over localhost. Well it has a few purposes. One, I can write basic yet native graphic programs in any language I choose as long it has a TCP library. Two, it serves a very poor interface for IoT devices. Three, and by far the most important reason, I like it. It works for me, it solves my problems in a way I like, with tools I like, and in a clean little package. 

## Docs

Start `telescope.tcl`. Open up a TCP connection to `localhost:1234`. That's literally all the setup.

### Input
To write a pixel to the screen, send `set [x] [y] [hexcolour]` to the server. `x` and `y` should be integers, hexcolour should be a 6 character string (no `#`). 

No other commands exist ATM.

### Output
The server can send 5 different actions:
- keypress
- keyrelease
- buttonpress
- buttonrelease
- mouse

`key` refers to a key on the keyboard. It will just send `key* [keyname]`.

Same goes for `button`, except buttons on the mouse.

`mouse` is mouse movement, both free and while a mousebutton is being held done.

That's it. It's really not rocket science.

## Other Stuff
Don't like it? Good for you for having opinions, but that ain't my problem. Like it? Lemme know and maybe help out.