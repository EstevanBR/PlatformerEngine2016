maxRunSpeed = 5; //the maximum runspeed
maxFallSpeed = 5; //the terminal velocity
jumpSpeed = 5; //the speed that you jump
runAccel = .5;
yprev=0;

keyboard_set_map(ord('w'), vk_up);
keyboard_set_map(ord('a'), vk_left);
keyboard_set_map(ord('s'), vk_down);
keyboard_set_map(ord('d'), vk_right);
/*
keyboard_set_map(vk_up, ord('w'));
keyboard_set_map(vk_left, ord('a'));
keyboard_set_map(vk_down, ord('s'));
keyboard_set_map(vk_right, ord('d'));
*/
sFriction = 0.85;
sGravity = .25;
yVel = 0;
xVel = 0;

inAir = true;
inMotion = false;

enum facing {
    left = -1,
    neutral = 0,
    right = 1
}
/*face:
    -1 = left
    0 = neither
    1 = right
*/


/*
How to make a platformer:
    1. Just do it

Notes:
    1. for physics:
        a. velocity then position
*/
