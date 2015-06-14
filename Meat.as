package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Meat extends Sprite
	{
		private var _meat:EnemyArt;
		private var _speed:int = 2;
		private var _dirX:Number;
		private var _dirY:Number;
		private var _player:Player;
		
		public function Meat() 
		{
			_meat = new EnemyArt();
			_meat.scaleX = 0.20;
			_meat.scaleY = 0.20;
			addChild(_meat);
			
			addEventListener(Event.ENTER_FRAME, update);
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function setDir():void
		{
			var difX:Number = _player.x - this.x;
			var difY:Number = _player.y - this.y;
			
			var dis:Number = (difX * difX) + (difY * difY);
			var fixDis:Number = Math.sqrt(dis);
			
			var fixDifX:Number = difX / fixDis;
			var fixDifY:Number = difY / fixDis;
			
			_dirX = fixDifX * _speed;
			_dirY = fixDifY * _speed;
			
		} 
		
		private function update():void
		{
			setDir();
			
			this.x += _dirX;
			this.y += _dirY;
		}
	}

}