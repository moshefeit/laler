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
	private var laler1:Player;
	private var laler2:Player;
	
	override public function create():Void
	{
		super.create();
		
		laler = new Player(FlxColor.GREEN, 90);
		laler1 = new Player(FlxColor.YELLOW, 0);
		laler2 = new Player(FlxColor.RED, 180);
		
		add(laler);
		add(laler1);
		add(laler2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ENTER)
		{
			laler.allowed = 1;
			laler1.allowed = 1;
			laler2.allowed = 1;			
		}
	}
}
