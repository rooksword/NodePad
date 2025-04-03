function NodeGet(_uid)
{
	var _len = instance_number(obj_node);
	for (var i = 0; i < _len; i++;)
	{
		var _node = instance_find(obj_node, i);
		if _uid == _node.uid
		{
			return _node;	
		}
	}
}