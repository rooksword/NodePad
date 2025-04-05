/// @desc Load

lines = [];
instance_destroy(obj_node);

var _file = get_open_filename("save file|*.save", "");

if file_exists(_file)
{
	var _buffer = buffer_load(_file);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_data = json_parse(_string);
	
	lines = array_shift(_load_data);
	
	var _len = array_length(_load_data);
	for (var i = 0; i < _len; i++;)
	{
		var _node = _load_data[i];
		var _inst = instance_create_layer(_node.x, _node.y, "Instances", obj_node);
		_inst.uid = _node.uid;
		_inst.connections = _node.connections;
		_inst.lines = _node.lines;
	}
	
	save = _file;
}