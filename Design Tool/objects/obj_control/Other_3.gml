/// @desc Save

var _save_data = [];

with obj_node
{
	var _save_entity =
	{
		x : x,
		y : y,
		uid : uid,
		connections: connections,
		lines : lines
	}
	
	array_push(_save_data, _save_entity);
}

var _string = json_stringify(_save_data);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "nodes.save");
buffer_delete(_buffer);