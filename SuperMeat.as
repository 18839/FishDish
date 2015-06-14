package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class SuperMeat extends Sprite
	{
		private var _supermeat:EnemyArt;
		private var _speed:int = 2;
		private var _dirX:Number;
		private var _dirY:Number;
		private var _player:Player;
		
		private var PcolorTimer:int;
		
		public function SuperMeat() 
		{
			_supermeat = new EnemyArt();
			_supermeat.scaleX = 0.20;
			_supermeat.scaleY = 0.20;
			addChild(_supermeat);
			
			_supermeat.x = 100;
			_supermeat.y = 100;
			
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
			
			PcolorTimer--;
			
			if (PcolorTimer <= 0)
			{
				var PmyColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
				this.transform.colorTransform = PmyColor;
				PcolorTimer = 5;
			}			
		}
	}

}