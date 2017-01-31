# Make canvas
canvas .c -bg white
pack .c -fill both -expand 1

# Make image within canvas
set ::img [image create photo -palette 256/256/256]
.c create image 0 0 -image $::img -anchor nw

proc draw_pixel {x y hex} {
	# puts [image width $::img]
	$::img put #$hex -to $x $y
}

proc img_size {x y} {
	# $::img configure -width $x -height $y
	# puts [$::img cget -width]
}

return "canvas loaded"