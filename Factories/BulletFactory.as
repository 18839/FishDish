package Factories 
{
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class BulletFactory 
	{
		private var _bullet:Bullet;
		
		public function createBullet(playerRot:Number):Bullet
		{
			return _bullet = new Bullet(playerRot -90);
		}
	}

}