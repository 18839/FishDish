package  
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class LifeManager extends Sprite
	{
		public var lives:Vector.<LifeArt>;
		private var _lifeOffset:int = 50;
		public var lifeCoolDown:Boolean = false;
		private var _lifeTimer:Timer;
		
		public function LifeManager() 
		{
			lives = new Vector.<LifeArt>;
			
			//lives.scaleX = 0.7;
			_lifeTimer = new Timer(1000, 0);
			
			_lifeTimer.addEventListener(TimerEvent.TIMER, setCoolDown);
			
			for (var i:int = 0; i < 3; i++)
			{
				var newLife:LifeArt = new LifeArt();
				newLife.scaleX = newLife.scaleY = 0.2;
				
				newLife.x = _lifeOffset * i;
				addChild(newLife);
				lives.push(newLife);
				
				
				
			var greenlivecolor:ColorTransform = new ColorTransform(1, 255, 255, 1, 0,0,0,0);
			lives[0].transform.colorTransform = greenlivecolor;
			}
		}
		
		private function setCoolDown(e:TimerEvent):void 
		{
			lifeCoolDown = false;
		}
		
		public function removeLife():void
		{
 			if (lives.length > 0 && lifeCoolDown == false)
			{
				removeChild(lives[lives.length - 1]);
				lives.splice(lives.length - 1, 1);
				lifeCoolDown = true;
				_lifeTimer.start();
			}
			
		}
		
	}
	
	

}