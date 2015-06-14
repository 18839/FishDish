package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Joey Koedijk
	 */
	public class Endscreen extends Sprite
	{
		private var _endscreen:EndScreenArt;
		
		public function Endscreen() 
		{
			_endscreen = new EndScreenArt();
			
			addChild(_endscreen);
		}
		
	}

}