package require Tk
puts [source "server.tcl"]

# Bind close button to exit program
wm protocol . WM_DELETE_WINDOW {
	exit
}

# Make canvas
pack [canvas .c] -fill both -expand 1

# Pipe keyboard output to steam
bind . <KeyPress> { send_data "keypress %A" }
bind . <KeyRelease> { send_data "keyrelese %A" }
bind . <ButtonPress> { send_data "buttonpress %b %x %y" }
bind . <ButtonRelease> { send_data "buttonrelease %b %x %y" }
bind . <Motion> { send_data "mouse %x %y" }

# Start Server
set sock [socket -server connect 1234]

# Loop forever
vwait forever