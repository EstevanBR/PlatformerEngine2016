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


/*JUMPING CODE YEAH HRRNGH BIG BUTTS*/

if ((!inAir) and (keyboard_check_pressed(vk_space))) {
    yVel = -jumpSpeed;
    inAir = true;
}

/*then positions*/
if (place_meeting(x,y+yVel,obj_block) == false) {
    y+=yVel;
} else {
    for (i = 0; i <= floor(yVel)+1; i++) {
        if (place_meeting(x,y+i,obj_block)==true) {
            y += i;
            inAir = false;
            //yVel = 0;//this resets velocity to 0, otherwise if you fall off a block, you will fall at the speed you were falling when you landed. -E
            break;
        }
    }
    yprev = y;
    //move_contact_solid(270,yVel);
    // the x proportion that you have left to move, that needs to be influenced by friction
    xproportion = (1-sqr(y-yprev)/(sqr(yVel) + sqr(xVel)));
}

//x+=xproportion * xVel;
xVel = xproportion * xVel;
//x+=xVel;
if (place_meeting(x+xVel,y,obj_block)==false) {
    //if there is no block at x+xVel
    x+=xVel;
    //move to x+xVel
}
if (x-xprevious != 0) {
    inMotion = true;
} else {
    inMotion = false;
}

x = x mod room_width;
y = y mod room_height;
