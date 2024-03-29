/// @description Wrap(value, min, max)
/// @function Wrap
/// @param value
/// @param min
/// @param max
// Returns the value wrapped, values over or under will be wrapped around

function wrap(){
		if (argument0 mod 1 == 0)
	{
	    // Feather disable once GM1032
	    while (argument0 > argument2 || argument0 < argument1)
	    {
	        if (argument0 > argument2)
	            argument0 += argument1 - argument2 - 1;
	        else if (argument0 < argument1)
	            argument0 += argument2 - argument1 + 1;
	    }
	    return(argument0);
	}
	else
	{
	    var v_old = argument0 + 1;
	    while (argument0 != v_old)
	    {
	        v_old = argument0;
	        if (argument0 < argument1)
	            argument0 = argument2 - (argument1 - argument0);
	        else if (argument0 > argument2)
	            argument0 = argument1 + (argument0 - argument2);
	    }
	    return(argument0);
	}
}