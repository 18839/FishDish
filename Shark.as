package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class Shark extends Sprite
	{
		private var _enemyArt:MovieClip;
		private var _asteroidArt:MovieClip;
		private var _speed:int = 1;
		private var _dirX:Number;
		private var _dirY:Number;
		private var _eatable:Boolean;
		private var _enemyRot:Number;
		private var _enemyDirX:Number;
		private var _enemyDirY:Number;
		private var _player:Player;
		
		private var yellowColor:ColorTransform;
		
		public var spawnSide:int;

		
		
		public function Shark(spawn:Number, game:Game, player:Player, size:Number) 
		{	
			_player = player;
			spawnSide = spawn;
			_asteroidArt = new SharkArt();
			
			_asteroidArt.scaleX = 0.2;
			_asteroidArt.scaleY = 0.2;
			
			
			var yellowColor:ColorTransform = new ColorTransform(1, 1, 1, 1, 1,255,1,1);
			_asteroidArt.transform.colorTransform = yellowColor;
			
			_dirX = Math.random() * _speed;
			_dirY = Math.random() * _speed;
			
			addChild(_asteroidArt);
			//left 
			if (spawnSide == 0)
			{
				
				if (_dirY < 5)
				{
					_dirY = Math.random() * -_speed;
				}
				else
				{
					_dirY = Math.random() * _speed;
				}
				
				this.x = -200;
				this.y = 400;
			}
			//right 
			else if (spawnSide == 1)
			{
				if (_dirY < 5)
				{
					_dirY = Math.random() * -_speed;
				}
				else
				{
					_dirY = Math.random() * _speed;
				}
				this.x = 1500;
				this.y = 100;
				
				_dirX = -_dirX;
				
			}
			// up
			else if (spawnSide == 2)
			{
				if (_dirX < 5)
				{
					_dirX = Math.random() * -_speed;
				}
				else
				{
					_dirX = Math.random() * _speed;
				}
				
				this.x = 400;
				this.y = -100;
				_dirY = -_dirY;
			}
			// down
			else if (spawnSide == 3)
			{
				if (_dirX < 5)
				{
					_dirX = Math.random() * -_speed;
				}
				else
				{
					_dirX = Math.random() * _speed;
				}
				this.x = 400;
				this.y = 700;
			}
		}
		
		private function faceTarget():void
		{
			var difX:Number = _player.x - this.x;
			var difY:Number = _player.y - this.y;
			
			var rad:Number = Math.atan2(difY, difX);
			var deg:Number = rad * 180 / Math.PI;
			
			this.rotation = deg + 90;
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
		
		public function update(scoreboard:scoreBoardBucket):void
		{	
			setDir();
			faceTarget();
			
			this.x += _dirX;
			this.y += _dirY;
		}
		
	}

}