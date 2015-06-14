package Factories 
{
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class AsteroidFactory 
	{
		private var _asteroid:Asteroid;
		private var _game:Game;
	
		
		public function createAsteroid(player:Player, size:Number):Asteroid
		{
			
			return _asteroid = new Asteroid(Math.floor(Math.random() * 2), _game, player, size);
			
			
		}
		
	}

}