package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var laler:Player;

	
	override public function create():Void
	{
		super.create();
		
		laler = new Player(FlxColor.GREEN, 90);

		add(laler);
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			laler.allowed = 1;		
		}
		
		super.update(elapsed);
		laler.allowed = 0;
	}
}
