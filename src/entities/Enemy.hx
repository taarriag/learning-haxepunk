package entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Enemy extends Entity{
	public function new()
	{
		super();
		graphic = new Image("gfx/enemy.png");
		x = HXP.rand(HXP.width);
		y = HXP.rand(HXP.height);
		type = "enemy";
		setHitbox(100,60,0,-80);
		this.layer = 0;
		
	}
}