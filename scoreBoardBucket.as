package
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Joey Koedijk
	 */
	public class scoreBoardBucket extends TextField
	{
		private var _score:Number = 0;
		[Embed(source = "../font/RAVIE.ttf",fontName="myFont",embedAsCFF="false")]
		private var font:Class;
		
		public function set score(s:Number):void
		{ 
			_score = s;
			this.text = "BUCKET: " + score;
		}
		
		public function get score():Number
		{
			return _score;
		}
		
		public function scoreBoardBucket() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);					
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("myFont",30,0xFFFFFF,true );
			this.width = stage.stageWidth;
			this.text = "BUCKET: " + score;
			this.embedFonts = true;
		}
		
	}

}