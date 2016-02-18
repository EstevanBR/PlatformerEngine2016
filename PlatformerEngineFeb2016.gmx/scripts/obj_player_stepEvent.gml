xproportion = 1;

/*velocities first*/

/*RUNNING F YEAH!!!*/

if (!inAir) {
    if (keyboard_check(vk_left) ){
        xVel-=runAccel;
    }
    if (keyboard_check(vk_right)){
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
    for (i = 0; i <= yVel; i++) {
    xproportion = (1-sqr(y-yprevious)/(sqr(yVel) + sqr(xVel)));
        if (place_meeting(x,y +i,obj_block)==true) {
            y += i;
            yVel = 0;
            break;
        }
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
}

/*am I lik movin horz?*/
if (x-xprevious != 0) {
    inMotion = true;
} else {
    inMotion = false;
}
x = x mod room_width;
y = y mod room_height;
