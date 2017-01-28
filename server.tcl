# Shoutout to rmax <http://wiki.tcl.tk/1003> for the base code

puts [source "canvas.tcl"]

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
proc command {input} {
	switch [lindex $input 0] {
		set {
			# puts "x: [lindex $input 1] y: [lindex $input 2] r: [lindex $input 3] g: [lindex $input 4] b: [lindex $input 5]"
			draw_pixel .c [lindex $input 1] [lindex $input 2] [lindex $input 3] [lindex $input 4] [lindex $input 5]
		}

		default {
			puts [join $input "-"]
		}
	}
}

# Send string to all users
proc send_data {text} {
	foreach s [array names ::sockets] {
		puts $s $text
	}
}

return "server loaded"