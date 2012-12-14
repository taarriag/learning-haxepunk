package worlds;

import com.haxepunk.World;
import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;
import entities.Player;
import entities.Enemy;
import levels.Level;
import nme.Assets;
import nme.geom.Point;

class GameWorld extends World{
	private var square:Entity;
	private var level:Level;

	public function new(){
		super();
	}

	
	override public function begin() {
		//We load the level XML file 
		//NOTE: If a new folder is added into the assets folder, edit project.nmml so that it considers the 
		//
		var xml:Xml = Xml.parse(Assets.getText("levels/first-game.oel"));
		var level:Level = cast(this.add(new Level(xml)),Level);

		var dataList = level.levelData.node.objects.node.playerStart;
		var playerPoint = new Point(Std.parseInt(dataList.att.x),Std.parseInt(dataList.att.y));
		this.add(new Player(playerPoint));

		super.begin();
	}

	

	override public function update()
	{
		super.update();	
	}
}