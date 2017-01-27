package require Tk
puts [source "server.tcl"]

# Make canvas
pack [canvas .c] -fill both -expand 1

# Pipe keyboard output to steam
bind . <KeyPress> { send_data %A }

# Start Server
set sock [socket -server connect 1234]

# Loop forever
vwait forever