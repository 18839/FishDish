package Factories 
{
	import flash.automation.StageCaptureEvent;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class SuperMeatFactory 
	{
		private var _supermeat:SuperMeat;
		
		public function createsuperMeat():SuperMeat
		{
			return new SuperMeat();
		}
		
	}

}