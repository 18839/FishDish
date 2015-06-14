package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Bullet extends Sprite
	{
		private var _bulletArt:BulletArt;
		private var _bulletAngle:Number;
		private var _speed:int = 20;
		
		public function Bullet(playerRot:Number) 
		{	
			_bulletAngle = playerRot * Math.PI / 180;
			_bulletArt = new BulletArt();
			addChild(_bulletArt);
			
			_bulletArt.scaleX = _bulletArt.scaleY = 0.1;
			
		}
		
		public function update():void
		{
			this.x += _speed * Math.cos(_bulletAngle);
			this.y += _speed * Math.sin(_bulletAngle);
		}
		
	}

}