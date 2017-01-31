puts $::img

proc draw_pixel {x y hex} {
	puts "$x $y [incr x] [incr y]"
	$::img put #$hex -to $x $y [incr x] [incr y]
}