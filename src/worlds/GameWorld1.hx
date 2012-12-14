package worlds;

import com.haxepunk.World;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import flash.display.BitmapData;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;

class GameWorld extends World{
	private var square:Entity;

	public function new(){
		super();
		trace("Gameworld constructor");
	}

	
	override public function begin() {
		var image:Image = Image.createRect(16,16,0xffffffff);
		square = new Entity(0,0,image);
		add(square);
		super.begin();
	}
	

	override public function update()
	{
		square.x = Input.mouseX;
		square.y = Input.mouseY;

		if(Input.mousePressed)
		{
			var squareGraphic:Image = cast(square.graphic,Image);
			squareGraphic.color = HXP.rand(0xffffff); 
			trace("Mouse pressed");
		}
		super.update();	
	}
}