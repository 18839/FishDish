package  
{
	import Factories.AsteroidFactory;
	import Factories.MeatFactory;
	import Factories.SuperMeatFactory;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Rishaad Hausil, Ferry Elbaghdadi
	 */
	public class Engine extends Sprite
	{
		
		private var _meatOffset:int = 50;
		private var _supermeatOffset:int = 50;
		private var destroySFX:Sound;
		
		public function Engine() 
		{
			destroySFX = new Sound();
			destroySFX.load(new URLRequest("../audio/explosion.mp3"));
		}
		
		public function checkCollision(asteroids:Vector.<Asteroid>, blowfish:Vector.<BlowFish>, shark:Vector.<Shark>, bullets:Vector.<Bullet>, game:Game, scoreboard:scoreBoard, player:Player, food:Vector.<Meat>, superfood:Vector.<SuperMeat>, meatFctry:MeatFactory, supermeatFctry:SuperMeatFactory, lifeMngr:LifeManager):void
		{	
			for (var i:int = asteroids.length - 1; i >= 0; i--)
			{	
				if (asteroids[i].hitTestPoint(player.x, player.y, true)&& lifeMngr.lifeCoolDown == false)
				{
					lifeMngr.removeLife();
					game.removeChild(asteroids[i])
					asteroids.splice(i, 1);
				}
				for (var j:int = bullets.length -1; j >= 0; j--)
				{	
					if (i >= asteroids.length) continue;
					 
        			if (asteroids[i].hitTestObject(bullets[j]))
					{	
						for (var k:int = 0; k < 1; k++)
						{	
							var newMeat:Meat = meatFctry.createMeat();
							game.addChild(newMeat);
							newMeat.x = asteroids[i].x + Math.random() * _meatOffset;
							newMeat.y = asteroids[i].y + Math.random() * _meatOffset;
							food.push(newMeat);
							
						}
						
						game.removeChild(asteroids[i]);
						game.removeChild(bullets[j]);
						asteroids.splice(i, 1);
						bullets.splice(j, 1);
						destroySFX.play(0, 1);
					}				
				}
			}
			
			for (var b:int = blowfish.length - 1; b >= 0; b--)
			{
				if (blowfish[b].hitTestPoint(player.x, player.y, true) && lifeMngr.lifeCoolDown == false)
				{
					lifeMngr.removeLife();
					game.removeChild(blowfish[b])
					blowfish.splice(b, 1);
				}
				
				for (var w:int = bullets.length -1; w >= 0; w--)
				{	
					if (b >= blowfish.length) continue;
					 
        			if (blowfish[b].hitTestObject(bullets[w]))
					{	
						for (var q:int = 0; q < 1; q++)
						{	
							var newMeat2:Meat = meatFctry.createMeat();
							game.addChild(newMeat2);
							newMeat2.x = blowfish[b].x + Math.random() * _meatOffset;
							newMeat2.y = blowfish[b].y + Math.random() * _meatOffset;
							food.push(newMeat2);
						}
						
						game.removeChild(blowfish[b]);
						game.removeChild(bullets[w]);
						blowfish.splice(b, 1);
						bullets.splice(w, 1);
						destroySFX.play(0, 1);
					}				
				}
			}
			
			for (var s:int = shark.length - 1; s >= 0; s--)
			{	
				if (shark[s].hitTestPoint(player.x, player.y, true) && lifeMngr.lifeCoolDown == false)
				{
					lifeMngr.removeLife();
					game.removeChild(shark[s])
					shark.splice(s, 1);
				}
				
				for (var a:int = bullets.length -1; a >= 0; a--)
				{	
					if (s >= shark.length) continue;
					 
        			if (shark[s].hitTestObject(bullets[a]))
					{	
						for (var h:int = 0; h < 1; h++)
						{	
							var colorenergy:Meat = meatFctry.createMeat();
							game.addChild(colorenergy);
							colorenergy.x = shark[s].x + Math.random() * _meatOffset;
							colorenergy.y = shark[s].y + Math.random() * _meatOffset;
							food.push(colorenergy);
						}
						
						game.removeChild(shark[s]);
						game.removeChild(bullets[a]);
						shark.splice(s, 1);
						bullets.splice(a, 1);
						destroySFX.play(0, 1);
					}				
				}
			}
		}
		
	}

}