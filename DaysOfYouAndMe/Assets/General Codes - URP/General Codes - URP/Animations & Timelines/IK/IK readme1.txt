in the Animator - set the Base Layer's IK Pass - to true

you can use a tag on the ground layer if you want...

make sure your character's main capsule collider isn't covering your feet (rise it on the y axis)
something like 1.1 on the y

create a layer for the player \ chracter this IK script is on - and choose everything in the layer mask option and then tick-off this new player layer.
this way, the IK code won't work on the player\character itself
Mixed...

if you want the IK to work according to the animations:
add 2 floats in the animator:
IKLeftFootWeight
IKRightFootWeight

create cruves inside each animation that match when the feet hit the ground or not.
1 = full IK in the curve
0 - no IK in the curve