package levels;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.HXP;
import com.haxepunk.masks.Grid;
import haxe.xml.Fast;

class Level extends Entity{
	private var _tiles:Tilemap;
	private var _grid:Grid;
	public var levelData:Fast;

	public function new(xml:Xml){
		super();

		_tiles = new Tilemap("gfx/tileset.png",HXP.width,HXP.height,32,32);
		graphic = _tiles;
		layer = 1;

		_grid = new Grid(640,480,32,32,0,0);
		mask = _grid;
		type = "level";

		loadLevel(xml);

	}

	private function loadLevel(xml:Xml)
	{
		var fast = new haxe.xml.Fast(xml.firstElement());
		this.levelData = fast;

		trace(levelData.att.width);
		var ourTiles = levelData.node.OurTiles;

		//Drawing tiles
		for(t in ourTiles.nodes.tile){
			_tiles.setTile(Std.parseInt(t.att.x), Std.parseInt(t.att.y),Std.parseInt(t.att.id));
			if(Std.parseInt(t.att.id)==1)
				_grid.setTile(Std.parseInt(t.att.x), Std.parseInt(t.att.y),true);
		}


	}
}