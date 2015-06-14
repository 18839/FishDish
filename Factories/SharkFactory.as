package Factories 
{
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class SharkFactory 
	{
		private var _shark:Shark;
		private var _game:Game;
	
		
		public function createShark(player:Player, size:Number):Shark
		{
			
			return _shark = new Shark(Math.floor(Math.random() * 2), _game, player, size);
			
			
		}
		
	}

}