package
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class FinalEnergy extends TextField
	{
		private var _score:Number = 0;
		[Embed(source = "../font/RAVIE.ttf",fontName="myFont",embedAsCFF="false")]
		private var font:Class;
		
		public function set score(s:Number):void
		{ 
			_score = s;
			this.text = "FINAL ENERGY: " + score;
		}
		
		public function get score():Number
		{
			return _score;
		}
		
		public function FinalEnergy() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("myFont",30,0xFFFF00,true );
			this.width = stage.stageWidth;
			this.text = "FINAL ENERGY: " + score;
			this.embedFonts = true;
		}
		
	}

}