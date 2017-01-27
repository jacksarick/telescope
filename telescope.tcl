package require Tk

# Make canvas
pack [canvas .c] -fill both -expand 1

# Pipe keyboard output to steam
bind . <KeyPress> { send_data %A }


# Server Stuff
set sock [socket -server connect 1234]

# On connect
proc connect {sock host port} {
	# Buffer line
	fconfigure $sock -blocking 0 -buffering line

	# Read data when available
	fileevent $sock readable [list user_data $sock]

	# Add socket to list
	set sockets($sock) $sock
}

# When we get data
proc user_data {sock} {
	gets $sock line

	# If it's terimnal, remove them
	if {[eof $sock]} {
		unset sockets($sock)
		close $sock
		return
	}

	# Do nothing for blank
	if {$line eq ""} return

	# Interpret valid data
	puts "$line"
}

# Send string to all users
proc send_data {text} {
	foreach s [array names sockets] {
		puts $s $text
	}
}

# Loop forever
vwait forever