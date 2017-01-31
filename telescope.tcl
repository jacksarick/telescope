#!/usr/bin/tclsh
package require Tk

# Bind close button to exit program
wm protocol . WM_DELETE_WINDOW {
	exit
}

# Load server
puts [source "server.tcl"]
puts [source "canvas.tcl"]

# Start Server
set server [socket -server connect 1234]

# Bind resize event to image resize
bind . <Configure> {img_size [winfo width %W] [winfo height %W]}

# Pipe keyboard output to steam
bind . <KeyPress> { send_data "keypress %A" }
# bind . <KeyRelease> { send_data "keyrelese %A" }
bind . <ButtonPress> { send_data "buttonpress %b %x %y" }
# bind . <ButtonRelease> { send_data "buttonrelease %b %x %y" }
# bind . <Motion> { send_data "mouse %x %y" }

# Loop forever
vwait forever
