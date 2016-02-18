xproportion = 1;

/*velocities first*/

/*RUNNING F YEAH!!!*/

if (!inAir) {
    if (keyboard_check(vk_left) and place_meeting(x-1,y,obj_block) == false){
        xVel-=runAccel;
    }
    if (keyboard_check(vk_right) and place_meeting(x+1,y,obj_block) == false){
        xVel+=runAccel;
    }
    xVel*=sFriction;
}

/*GRAVITY FALLING CODE*/

if (yVel < maxFallSpeed) {
    if (yVel+sGravity < maxFallSpeed) {
        yVel += sGravity;
    } else {
        yVel = maxFallSpeed
    }
}

/*LANDING CODE:then y positions*/
if (place_meeting(x,y+yVel,obj_block) == false) {
    y +=yVel;
} else {
    yVel = 0;
    while(place_meeting(x,y+1,obj_block) == false) {
        y+=1;
        //yVel = 0;
    }
}

/*AM I IN THE AIR????!??!!??!?!?!?!?!1?!?!?!ELEVEN!?!?!*/
if (place_meeting(x,y+1,obj_block) == true) {
    inAir = false;
} else {
    inAir = true;
}

/*JUMPING CODE YEAH HRRNGH BIG BUTTS*/

if ((!inAir) and (keyboard_check_pressed(vk_space))) {
    yVel = -jumpSpeed;
}


xVel = xproportion * xVel;

if (place_meeting(x+xVel,y,obj_block) == false) {
        x+=xVel;
} else {
    xVel = 0;
    while(place_meeting(x+1*facing,y,obj_block) == false) {
        x+=1*facing;
        //xVel = 0;
    }
}

/*am I lik movin horz?*/
if (x-xprevious != 0) {
    inMotion = true;
    if (x-xprevious > 0) {
        facing = facing.right;
    } else {
        facing = facing.left;
    }
} else {
    inMotion = false;
}
x = x mod room_width;
y = y mod room_height;
