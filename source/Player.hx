package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Moshe Feit
 */
class Player extends FlxSprite
{
	// Trigger
	public var allowed:Int = 0;
	
	private var valueHolder:Array<Int> = [];
	private var turn:Array<Int> = [5, 6, 10, 11];
	
	// Basic identity
	private var speed:Float = 500;
	private var directions:Int = 0;
	
	// To determine current heading
	private var lastPost:FlxPoint;
	
	private var up:Bool = false;
	private var down:Bool = false;
	private var left:Bool = false;
	private var right:Bool = false;
	
	private var value:FlxRandom;
	
	public function new(?Color:FlxColor, ?Directions:Int) 
	{
		
		super();
		
		this.makeGraphic(16, 16, Color);
		this.screenCenter();
		
		this.drag.x = this.drag.y = 1600;
		
		for ( i in 1...20)
		{
			this.valueHolder.insert(this.valueHolder.length, i);
		}
		
		this.directions = Directions;
		
		if (this.directions == 0)
		{
			this.right = true;
		} else if (this.directions == 90)
		{
			this.down = true;
		} else if (this.directions == 180)
		{
			this.left = true;
		} else if (this.directions == 270)
		{
			this.up = true;
		}
		
		this.value = new FlxRandom(1);
	}
	
	public function move()
	{
		
		var randomDecision = value.getObject(valueHolder);
		var randomTurn = value.getObject([ -45, 45]);
		
		if (this.turn.indexOf(randomDecision) != -1)
		{
			this.directions = this.directions + randomTurn;
		}
				
		if (this.directions > 360)
		{
			this.directions -= 360;
		} else if (directions < 0)
		{
			this.directions += 360;
		}
		
		this.velocity.set(this.speed, 0);
		this.velocity.rotate(FlxPoint.weak(0, 0), this.directions);
		
		this.fixDirections();
	}
	
	private function reachingEdge()
	{
		if (this.x > FlxG.width)
		{
			this.x -= FlxG.width;
		} else if (this.x < 0)
		{
			this.x += FlxG.width;
		}
		
		if (this.y > FlxG.height)
		{
			this.y -= FlxG.height;
		} else if (this.y < FlxG.height)
		{
			this.y += FlxG.height;
		}
	}
	
	private function fixDirections()
	{
		if (this.left = true && this.directions > 90 && this.directions < 270)
		{
			if (this.directions > 180)
			{
				this.up = true;
				this.down = false;
			} else {
				this.down = true;
				this.up = false;
			}
		} else if (this.up == true && this.directions > 180 && (this.directions < 360 || this.directions < 0))
		{
			if (this.directions < 270)
			{
				this.left = true;
				this.right = false;
			} else {
				this.right = true;
				this.left = false;
			}
		} else if (this.right == true && (this.directions > 270 || this.directions < 360) && this.directions < 90)
		{
			if (this.directions < 0)
			{
				this.up = true;
				this.down = false;
			} else {
				this.up = false;
				this.down = true;
			}
		} else if (this.down == true && this.directions > 0 && this.directions < 180)
		{
			if (this.directions < 90)
			{
				this.right = true;
				this.left = false;
			} else {
				this.right = false;
				this.left = true;
			}
		}
	}
	
	override public function update(elapsed:Float):Void
	{
		if (this.allowed == 1)
		{
			this.move();
			this.reachingEdge();
			
			super.update(elapsed);
			
		}
	}
	
}