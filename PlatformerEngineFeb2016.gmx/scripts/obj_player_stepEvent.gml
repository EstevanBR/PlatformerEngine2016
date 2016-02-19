/*SETTING X VELOCITY*/

if (!inAir) {
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

/* MOVE X*/
if (place_meeting(x+xVel,y,obj_block) == false) {
        x=x+xVel;
} else {
    //xVel = 0;
    while(place_meeting(x+1*facing,y,obj_block) == false) {
        x+=1*facing;
    }
}


/*LANDING CODE:then y positions*/
if (place_meeting(x,y+yVel,obj_block) == false) {
    y +=yVel;
    inAir = true;
} else {
    inAir = false;
    xproportion = (1-sqr(y-yprevious)/(sqr(yVel) + sqr(xVel)));
    xVel = xproportion * xVel;
    yVel = 0;
    while(place_meeting(x,y+1,obj_block) == false) {
        y+=1;
    }
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
