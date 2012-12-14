import com.haxepunk.Engine;
import com.haxepunk.HXP;
import worlds.GameWorld;

class Main extends Engine
{

	public static inline var kScreenWidth:Int = 640;
	public static inline var kScreenHeight:Int = 480;
	public static inline var kFrameRate:Int = 31;
	public static inline var kClearColor:Int = 0x333333;
	public static inline var kProjectName:String = "first-game";

	public function new()
	{
		super(kScreenWidth, kScreenHeight, kFrameRate, false);
		HXP.screen.scale = 1;
	}

	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		HXP.screen.color = kClearColor;
		HXP.world = new GameWorld();
	}

	public static function main()
	{
		new Main();
	}

}