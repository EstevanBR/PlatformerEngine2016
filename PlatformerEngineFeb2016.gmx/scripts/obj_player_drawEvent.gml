draw_sprite(sprite_index, image_index,x,y);
draw_text(24,10,"xVel is " + string(xVel));
draw_text(24,20,"yVel is " + string(yVel));
draw_text(24,30,"x is" + string(x) + "y is " + string(y));
draw_text(24,40,"xproportion is " + string(xproportion));
draw_text(24,50,"direction is" + string(point_direction(xprevious,yprevious,x,y)));
draw_text(24,60,"overall speed is" + string(point_distance(xprevious,yprevious,x,y)));
if (place_meeting(x,y,obj_block)) {
    draw_text(24,70,"blocked");
}
