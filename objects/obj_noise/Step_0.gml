/// @description Stop projection
// You can write your code in this editor

// If the distance to the stopping point is larger than 5,
// Move the projection towards the stopping point with
// a speed of 5
var dx = stopPoint_x-x,
	dy = stopPoint_y-y,
	dir = point_direction(0,0,dx,dy),
	xx = maxSpd * dcos(dir),
	yy = maxSpd * -dsin(dir);

xSpd = min(abs(xx),abs(dx))*sign(dx)
ySpd = min(abs(yy),abs(dy))*sign(dy)

var dv = movement_application(xSpd,ySpd);

if (dv[0]=0 && xSpd !=0) || (dv[1]=0 && ySpd !=0){
	instance_destroy()	
}