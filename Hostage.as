package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class Hostage extends Sprite
	{
		private var hostage:AplayerArt;
		
		public function Hostage()
		{	
			hostage = new AplayerArt();
			addChild(hostage);
			this.addEventListener (Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, update);
			
			var randomColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
			hostage.transform.colorTransform = randomColor;
		}
		
		public function update(e:Event):void
		{
			this.y += -2;
			
			
			//this.x = stage.stageWidth* 0.1;
		}
		
	}

}