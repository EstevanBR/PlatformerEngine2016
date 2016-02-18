draw_sprite(sprite_index, image_index,round(x),round(y));
draw_text(24,10,"xVel is " + string(xVel));
draw_text(24,20,"inAir is " + string(inAir));
draw_text(24,30,"y is " + string(y));
draw_text(24,40,"yprev is " + string(yprevious));
draw_text(24,50,"xproportion is " + string(xproportion));
draw_text(24,60,"bbox_bottom is" + string(bbox_bottom));
if (place_meeting(x,y,obj_block)) {
    draw_text(24,70,"blocked");
}
