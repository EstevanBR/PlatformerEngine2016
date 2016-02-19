/*SETTING X VELOCITY*/

if (true) {
    if (keyboard_check(vk_left) and !keyboard_check(vk_right) and place_meeting(x-1,y,obj_block) == false){
        if (abs(xVel-runAccel) < maxRunSpeed) {
            xVel-=runAccel;
        } else {
            xVel = -maxRunSpeed;
        }
        //facing = facing.left;
    }
    if (keyboard_check(vk_right) and !keyboard_check(vk_left) and place_meeting(x+1,y,obj_block) == false){
        if (xVel+runAccel < maxRunSpeed) {
            xVel+=runAccel;
        } else {
            xVel = maxRunSpeed;
        }
        //facing = facing.right;
    }
    if (!keyboard_check(vk_left) and !keyboard_check(vk_right)) {
        xVel*=sFriction;
    }
}

/*ADDING GRAVITY TO Y VELOCITY*/

if (yVel < maxFallSpeed) {
    if (yVel+sGravity < maxFallSpeed) {
        yVel += sGravity;
    } else {
        yVel = maxFallSpeed
    }
}
if abs(xVel) > 0.0005 {
    if not place_meeting(x+xVel,y, obj_block){
        x+=xVel;
    } else {
        move_contact_all(point_direction(x,y,x+xVel,y), abs(xVel));
        xVel = 0;
    }
}

/*LANDING CODE:then y positions*/
if (place_meeting(x,y+yVel,obj_block) == false) { // happens when moving down or up and the space is free
    y += yVel;
    inAir = true;
} else { // happens when moving down OR up and hitting something
    if yVel > 0 { // moving downward
        inAir = false;
        yprev = y;
        move_contact_all(270, abs(yVel));
        xproportion = (1-sqr(y-yprev)/(sqr(yVel) + sqr(xVel)));
        xVel = xproportion * xVel;
        yVel = 0;
    } else if (yVel < 0){ // moving upward
        move_contact_all(90, abs(yVel));
        yVel = 0;
    } else {
        // not moving in the y axis right now
    }
        //while(place_meeting(x,y+1,obj_block) == false) {
        //    y+=1;
        //}
}

/*JUMPING CODE*/
if ((!inAir) and (keyboard_check_pressed(vk_space))) {
    yVel = -jumpSpeed;
}

/*AM I X MOVING?*/
if (x-xprevious != 0) {
    inMotion = true;
} else {
    inMotion = false;
}

/******************************************/
/**************SETTING STATES**************/
if (inAir == false and inMotion == false) {
    state = state.idle;
}
if (inAir == false and inMotion == true) {
    state = state.running;
}
if (inAir = true and yprevious>y) {
    state = state.jumping;
}
if (inAir = true and y>yprevious) {
    state = state.falling;
}

if (x > xprevious) {
    facing = facing.right;
}

if (xprevious > x) {
    facing = facing.left
}
/**************SETTING STATES**************/
/******************************************/
