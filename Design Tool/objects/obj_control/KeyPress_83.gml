/// @desc Save

var _save_data = [lines];

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
if !file_exists(save) save = get_save_filename("save file|*.save", "");
else file_delete(save);
buffer_save(_buffer, save);
buffer_delete(_buffer);