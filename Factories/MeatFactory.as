package Factories 
{
	import flash.automation.StageCaptureEvent;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class MeatFactory 
	{
		private var _meat:Meat;
		
		public function createMeat():Meat
		{
			return new Meat();
		}
		
	}

}