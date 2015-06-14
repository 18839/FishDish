package Factories 
{
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class BlowFishFactory 
	{
		private var _blowfish:BlowFish;
		private var _game:Game;
	
		
		public function createBlowfish(player:Player, size:Number):BlowFish
		{
			
			return _blowfish = new BlowFish(Math.floor(Math.random() * 2), _game, player, size);
			
			
		}
		
	}

}