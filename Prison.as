package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class Prison extends Sprite
	{
		private var prison:PrisonArt;
		
		public function Lives()
		{	
			prison = new PrisonArt();
			addChild(prison);
		}
		
		public function update():void
		{

		}
		
	}

}