maxRunSpeed = 5; //the maximum runspeed
maxFallSpeed = 5; //the terminal velocity
jumpSpeed = 5; //the speed that you jump
runAccel = .5;
yprev=0;

keyboard_set_map(ord('W'), vk_up);
keyboard_set_map(ord('A'), vk_left);
keyboard_set_map(ord('S'), vk_down);
keyboard_set_map(ord('D'), vk_right);

sFriction = 0.85;
sGravity = .25;
yVel = 0;
xVel = 0;

inAir = true;
inMotion = false;

enum facing {
    left = -1,
    right = 1
}


/*
How to make a platformer:
    1. Just do it

Notes:
    1. for physics:
        a. velocity then position
*/
