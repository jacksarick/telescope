# Shoutout to rmax <http://wiki.tcl.tk/1003> for the base code

# On connect
proc connect {sock host port} {
	# Buffer line
	fconfigure $sock -blocking 0 -buffering line

	# Read data when available
	fileevent $sock readable [list user_data $sock]

	# Add socket to list
	set ::sockets($sock) $sock
}

# When we get data
proc user_data {sock} {
	gets $sock line

	# If it's terimnal, remove them
	if {[eof $sock]} {
		unset ::sockets($sock)
		close $sock
		return
	}

	# Do nothing for blank
	if {$line eq ""} return

	# Interpret valid data
	command [split $line]
}

# User commands
proc command {line} {
	switch [lindex $line 0] {
		set 

		default {}
	}
	puts [join $line "-"]
}

# Send string to all users
proc send_data {text} {
	foreach s [array names ::sockets] {
		puts $s $text
	}
}

return "server loaded"