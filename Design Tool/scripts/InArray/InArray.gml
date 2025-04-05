function InConnections(_inst, _arr)
{
	var _len = array_length(_arr);
	for (var i = 0; i < _len; i++;)
	{
		if _arr[i].object == _inst.uid
		{
			return i;	
		}
	}
	return -1;
}

function InConnected(_inst, _arr)
{
	var _len = array_length(_arr);
	for (var i = 0; i < _len; i++;)
	{
		if _arr[i] == _inst
		{
			return i;	
		}
	}
	return -1;
}