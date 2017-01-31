proc draw_pixel {x y hex} {
	puts [image width $::img]
	$::img put #$hex -to $x $y
}