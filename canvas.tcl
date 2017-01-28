proc name {args} {
	
}
proc draw_pixel {c x y r g b} {
	$c create rectangle $x $y [incr $x] [incr $y] -fill #$r$g$b -width 0
}