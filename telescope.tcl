package require Tk

# Bind close button to exit program
wm protocol . WM_DELETE_WINDOW {
	exit
}

# Make canvas
canvas .c -bg black
pack .c -fill both -expand 1
# puts [.c cget -height]

# Load server
puts [source "server.tcl"]

# Start Server
set server [socket -server connect 1234]

# Pipe keyboard output to steam
bind . <KeyPress> { send_data "keypress %A" }
# bind . <KeyRelease> { send_data "keyrelese %A" }
bind . <ButtonPress> { send_data "buttonpress %b %x %y" }
# bind . <ButtonRelease> { send_data "buttonrelease %b %x %y" }
# bind . <Motion> { send_data "mouse %x %y" }

# Loop forever
vwait forever
