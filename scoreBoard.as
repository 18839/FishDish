package
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Joey Koedijk
	 */
	public class scoreBoard extends TextField
	{
		private var _score:Number = 0;
		[Embed(source = "../font/RAVIE.ttf",fontName="myFont",embedAsCFF="false")]
		private var font:Class;
		
		public function set score(s:Number):void
		{ 
			_score = s;
			this.text = "ENERGY: " + score;
		}
		
		public function get score():Number
		{
			return _score;
		}
		
		public function scoreBoard() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);					
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("myFont",30,0x00FF00,true );
			this.width = stage.stageWidth;
			this.text = "ENERGY: " + score;
			this.embedFonts = true;
		}
		
	}

}