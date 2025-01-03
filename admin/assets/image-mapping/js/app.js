$(function(){
	$('#jcrop_target').Jcrop({
		onChange: showCoords,
		onSelect: showCoords
	});
});

function showCoords(c)
{
	$('#code-result').val(c.x+','+c.y+','+c.x2+','+c.y2);
};
