/// @desc Destroy node

var _delete = false;

if node_connecting != noone
{
	instance_destroy(node_connecting);
	_delete = true;
}
else if node_moving != noone
{
	instance_destroy(node_moving);
	_delete = true;
}
else if node_viewing != noone
{
	instance_destroy(node_viewing);
	_delete = true;
}

if _delete
{
	node_connecting = noone;
	node_moving = noone;
	node_viewing = noone;
}