package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class Lives extends Sprite
	{
		private var livesart:LifeArt;
		
		public function Lives()
		{	
				livesart = new LifeArt();
				addChild(livesart);
				
				livesart.scaleX = livesart.scaleY = 0.3;
		}
		
		public function update():void
		{

		}
		
	}

}