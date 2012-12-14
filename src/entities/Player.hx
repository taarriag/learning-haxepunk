package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import nme.geom.Point;

class Player extends Entity{
	private static var maxSpeed:Float = 7;
	private static var drag:Float = 0.6;
	private static var speed:Float = 3;


	public var image:Image;
	public var accelerationX:Float;
	public var accelerationY:Float;
	public var velocityX:Float;
	public var velocityY:Float;

	public function new(playerStart:Point)
	{
		super();
		//image = new Image("gfx/player.png");
		this.graphic = Image.createRect(32,32,0xff0000);
		this.setHitbox(32,32);
		this.type = "player";
		this.layer = 0;
		this.velocityX = 0;
		this.velocityY = 0;
		this.x = playerStart.x;
		this.y = playerStart.y;
	}

	public function handleInput()
	{
		accelerationX = 0;
		accelerationY = 0;

		if(Input.check(Key.RIGHT))
			accelerationX = 1;
		if(Input.check(Key.LEFT))
			accelerationX = -1;
		if(Input.check(Key.UP))
			accelerationY = -1;
		if(Input.check(Key.DOWN))
			accelerationY = 1;


	}

	public function updateMovement()
	{
		velocityX += accelerationX*speed;
		velocityY += accelerationY*speed;

		
		if(Math.abs(velocityX) > maxSpeed)
			velocityX = HXP.sign(velocityX)*maxSpeed;

		if(Math.abs(velocityY) > maxSpeed)
			velocityY = HXP.sign(velocityY)*maxSpeed;
	

		//El roce se encarga de disminuir la velocidad cuando dejamos de acelerar
		if(velocityX < 0)
			velocityX = Math.min(velocityX + drag, 0);		

		else if(velocityX > 0)
			velocityX = Math.max(velocityX - drag,0);

		if(velocityY < 0)
			velocityY = Math.min(velocityY + drag, 0);		

		else if(velocityY > 0)
			velocityY = Math.max(velocityY - drag,0);
		
		
	}

	private function updateCollision(){
		x += velocityX;
		

		if(collide("level",x,y)!= null)
		{
			if(HXP.sign(velocityX) > 0)
			{
				velocityX = 0;
				x = Math.floor( (x + width)/32) * 32 - width;
			}
			
			else
			{
				velocityX = 0;
				x = Math.floor(x / 32) * 32 + 32;
			}
		}

		y += velocityY;

		if(collide("level",x,y) != null)
		{
			if(HXP.sign(velocityY) > 0)
			{
				velocityY = 0;
				y = Math.floor((y + height) / 32 ) * 32 - height;
			}
			else{
				velocityY = 0;
				y = Math.floor(y/32)*32 + 32;
			}
		}

		if(collide("enemy",x,y) != null)
			//image.color = 0xff0000;
			trace("collision!");
		//else 

			//image.color = 0xffffff;

	}

	public override function update()
	{
		//Enable this to enable accelerated movement
		handleInput();
		updateMovement();
		updateCollision();

		/*
		if(Input.check(Key.RIGHT))
			x+= 100*HXP.elapsed;
		if(Input.check(Key.LEFT))
			x -= 100*HXP.elapsed;
		if(Input.check(Key.UP))
			y -= 100*HXP.elapsed;
		if(Input.check(Key.DOWN))
			y += 100*HXP.elapsed;
		*/

		

		super.update();
	}
}