package  
{
	import Factories.AsteroidFactory;
	import Factories.BlowFishFactory;
	import Factories.SharkFactory;
	import Factories.BulletFactory;
	import Factories.MeatFactory;
	import Factories.SuperMeatFactory;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.ui.Keyboard;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.display.Loader;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Ferry Elbaghdadi, Rishaad Hausil, Joey Koedijk
	 */
	 
	public class Game extends Sprite
	{
		
		//***FONT***
		[Embed(source = "../font/RAVIE.ttf",fontName="myFont",embedAsCFF="false")]
		private var font:Class;
		//***FONT***
		
		//***MAIN***
		private var main:Main;
		//***MAIN***
		
		[Embed(source = "../lib/Pausescreen.png")]
		private var PausescreenImage:Class;
		private var pause:Bitmap;
		
		
		//***BACKGROUND***
		private var backgroundA:Loader;
		private var backgroundURL:URLRequest;
		//***BACKGROUND***
		
		//***PLAYER***
		public var player:Player;
		//***PLAYER***
		
		//***SHOOT***
		private var shoot:Boolean = true;
		//***SHOOT***
		
		//***SFX***
		private var levelSFX:Sound;
		private var bulletSFX:Sound;
		private var tenSFX:Sound;
		private var eatSFX:Sound;
		private var friendSFX:Sound;
		private var biggerSFX:Sound;
		private var warningSFX:Sound;
		private var soundChannel:SoundChannel;
		private var mute:SoundTransform;
		//***SFX***
		
		private var cageexplosion:CageExplosion;
		
		//***scoreboards***
		public var scoreboard:scoreBoard;
		public var scoreboardbucket:scoreBoardBucket;
		//***scoreboards***
		
		//***Color transform***
		private var myColorTransform:ColorTransform;
		private var PmyColorTransform:ColorTransform;
		//***Color transform***
		
		//***TIMERS***
		private var colorTimer:int;
		private var PcolorTimer:int;
		private var _ShootTimer:Timer;
		//***TIMERS***
		
		//***PRISON***
		private var prison:PrisonArt;
		//***PRISON***

		//**FRIEND***
		private var friend:Hostage;
		//**FRIEND***
		
		//***TEXT***
		private var scoretext:TextField;
		private var addtext:TextField;
		private var finaltext:TextField;
		//***TEXT***
		
		//***GAME OVER***
		private var endscreen:EndScreenArt;
		//***GAME OVER***
		
		//***PAUSE***
		private var pausebutton:PauseButton;
		//***PAUSE***
		
		//***BOOLEANS***
		private var ispause:Boolean = false;
		private var _shootCoolDown:Boolean = false;
		//***BOOLEANS***
		
		//***VARIABLES***
		public var _stage:Stage;
		private var _spawnTimer:Timer;
		private var _spawnTimer2:Timer;
		private var _spawnTimer3:Timer;
		private var _asteroidsFactory:AsteroidFactory;
		private var _asteroids:Vector.<Asteroid>;
		private var _blowfishFactory:BlowFishFactory;
		private var _blowfish:Vector.<BlowFish>;
		private var _sharkFactory:SharkFactory;
		private var _shark:Vector.<Shark>;
		private var _bulletFactory:BulletFactory;
		private var _meatFactory:MeatFactory;
		private var _supermeatFactory:SuperMeatFactory;
		private var _bullets:Vector.<Bullet>;
		private var _engine:Engine;
		private var _food:Vector.<Meat>;
		private var _superfood:Vector.<SuperMeat>;
		private var _meat:Meat;
		private var vol:Number = 0;
		private var _lifeManager:LifeManager;
		private var _removeGame:Function;
		
		private var greenlive:Lives;
		private var orangelive:Lives;
		private var redlive:Lives;
		//***VARIABLES***
			
			
		public function Game(s:Stage, endGame:Function)
		{	
			_removeGame = endGame;
			_stage = s;
			_spawnTimer = new Timer(1000 , 0);
			_spawnTimer2 = new Timer(5000 , 0);
			_spawnTimer3 = new Timer(1000 , 0);
			_asteroidsFactory = new AsteroidFactory();
			_asteroids = new Vector.<Asteroid>;
			_blowfishFactory = new BlowFishFactory();
			_blowfish = new Vector.<BlowFish>;
			_sharkFactory = new SharkFactory();
			_shark = new Vector.<Shark>;
			_bullets = new Vector.<Bullet>;
			_bulletFactory = new BulletFactory();
			_engine = new Engine();
			_meatFactory = new MeatFactory();
			_food = new Vector.<Meat>();
			_superfood = new Vector.<SuperMeat>();
			mute = new SoundTransform(1, 0);
			endscreen = new EndScreenArt();
			pausebutton = new PauseButton();
			_ShootTimer = new Timer(300, 0);
			_lifeManager = new LifeManager();
			
			cageexplosion = new CageExplosion();
			
			_spawnTimer.addEventListener(TimerEvent.TIMER, spawnAsteroid);
			pausebutton.addEventListener(MouseEvent.CLICK, pauseButton);
			_ShootTimer.addEventListener(TimerEvent.TIMER, resetCoolDown);
			
	
			//FUNCTIONS
			addBackground();
			createPrison();
			createPlayer();
			playSFX();
			PauseScreen();
			fishEaten();
			_spawnTimer.start();
			_spawnTimer2.start();
			_spawnTimer3.start();
			addText();
			scoreText();
			addPause();
			//FUNCTIONS
			
			
			_lifeManager.x = 25;
			_lifeManager.y = 40;
			addChild(_lifeManager);
			
		}
		
		private function resetCoolDown(e:TimerEvent):void 
		{
			_shootCoolDown = false;
		}
		
		private function spawnAsteroid(e:TimerEvent):void 
		{
			if (_asteroids.length < 5)
			{
				var newAsteroid:Asteroid = _asteroidsFactory.createAsteroid(player, 0.4);
				addChild(newAsteroid);
				_asteroids.push(newAsteroid);
			}
		}
		
		private function spawnBlowFish(e:TimerEvent):void 
		{
			
			if (_blowfish.length < 5)
			{
				var newBlowFish:BlowFish = _blowfishFactory.createBlowfish(player, 0.5);
				addChild(newBlowFish);
				_blowfish.push(newBlowFish);
			}
		}
		
		private function spawnShark(e:TimerEvent):void 
		{
			
			if (_shark.length < 3)
			{
				var newShark:Shark = _sharkFactory.createShark(player, 0.4);
				addChild(newShark);
				_shark.push(newShark);
			}
		}
		
		private function addPause():void
		{
			addChild(pausebutton);
			
			
			pausebutton.y = 50;
			pausebutton.x = 900;
			
			pausebutton.scaleY = pausebutton.scaleX = 0.5;
		}
		
		private function finalText():void
		{
			finaltext = new FinalEnergy();
			addChild(finaltext);
			
			finaltext.y = 550;
			finaltext.x = 600;
		}
		
		private function pauseButton(e:MouseEvent):void
		{
			if (_spawnTimer.hasEventListener(TimerEvent.TIMER))
				{
					ispause = true;
				}
				else
				{
					shoot = true;
					removeChild(pause);
					_spawnTimer.addEventListener(TimerEvent.TIMER, spawnAsteroid);
					_stage.addEventListener(Event.ENTER_FRAME, update);
					mute.volume = 1;
					SoundMixer.soundTransform = mute;
				}				
		}
 
		private function addBackground():void 
		{
			backgroundA = new Loader();
			backgroundURL = new URLRequest("../lib/background.swf");
			
			backgroundA.load(backgroundURL);
			addChild(backgroundA);
			
			//backgroundA.width = _stage.stageWidth;
			//backgroundA.height = _stage.stageHeight;
			
			
			var bgColor:ColorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 15, 200);
			backgroundA.transform.colorTransform = bgColor;
		}
		
		public function PauseScreen():void
		{	
			
			pause = new PausescreenImage();
		}
		
			private function createPrison():void
		{
			prison = new PrisonArt();
			addChild(prison);
			
			prison.x = 500;
			prison.y = _stage.stageHeight / 2;
		}
		
		
		private function createPlayer():void
		{
			player = new Player();
			player.x = _stage.stageWidth / 2;
			player.y = _stage.stageHeight / 2;
			player.scaleX = player.scaleY = Math.abs(0.2);
			this.addChild(player);
		}
 
		private function playSFX():void 
		{
			levelSFX = new Sound();
			levelSFX.load(new URLRequest("../audio/level.mp3"));
			
			soundChannel = levelSFX.play(0, 10);
			
			bulletSFX = new Sound();
			bulletSFX.load(new URLRequest("../audio/shoot.mp3"));
				
			tenSFX = new Sound();
			tenSFX.load(new URLRequest("../audio/10.mp3"));
			

			
			eatSFX = new Sound();
			eatSFX.load(new URLRequest("../audio/energy.mp3"));
			
			friendSFX = new Sound();
			friendSFX.load(new URLRequest("../audio/friend.mp3"));
			
			biggerSFX = new Sound();
			biggerSFX.load(new URLRequest("../audio/bigger.mp3"));
			
			warningSFX = new Sound();
			warningSFX.load(new URLRequest("../audio/warning.mp3"));
			
		}
		
		
		public function update(event:Event):void
		{	
			if (_lifeManager.lives.length == 0)
			{
				_removeGame();
				soundChannel.stop();
				
			}
			
			for (var i:int = 0; i <= _asteroids.length - 1; i++)
			{
				if (_asteroids.length > 0)
				{
					_asteroids[i].update(scoreboardbucket);
				}
			}
			
			for (var b:int = 0; b <= _blowfish.length - 1; b++)
			{
				if (_blowfish.length > 0)
				{
					_blowfish[b].update(scoreboardbucket);
				}
			}
			
			for (var s:int = 0; s <= _shark.length - 1; s++)
			{
				if (_shark.length > 0)
				{
					_shark[s].update(scoreboardbucket);
				}
			}
			
			for (var j:int = 0; j <= _bullets.length - 1; j++)
			{
				if (_bullets.length > 0)
				{
					_bullets[j].update();
				}
			}
			
			_engine.checkCollision(_asteroids, _blowfish, _shark, _bullets, this, scoreboard, player, _food, _superfood, _meatFactory, _supermeatFactory, _lifeManager);
			
			
			//OUT OF BOUNDARIES RESPAWN
			
			//Y
			if (player.y >= 610)
			{
				player.y = -10;
				_bullets.splice(0,1);
			}
			if (player.y <= -20)
			{
				player.y = 600
				_bullets.splice(0,1);
			}
			
			
			//X			
			if (player.x >= 1010)
			{
				player.x = -10;
			}
			if (player.x <= -20)
			{
				player.x = 1010;
			}
			
			//if (_bullets.length >= 10)
			//{
				//_bullets.splice(0, 5);
			//}
			
			
			//OUT OF BOUNDARIES RESPAWN
			
			
			if (scoreboard.score >= 10)
			{
				//tenSFX.play(0, 1);
				addChild(scoretext);
				PcolorTimer--;
			
			if (PcolorTimer <= 0)
			{
				var PmyColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
				player.transform.colorTransform = PmyColor;
				PcolorTimer = 5;
			}			
			}
		
			
			if (scoreboard.score == 0)
			{
				var NmyColor:ColorTransform = new ColorTransform(1, 1, 1, 1, 0,0,0,0);
				player.transform.colorTransform = NmyColor;
			}
			
			if (scoreboard.score >= 17)
			{
				warningSFX.play(0, 1);
			}
			
			if (prison.hitTestObject(player))
			{
				//trace("raakt!");
				if (scoreboard.score >= 10)
				{
					freeFish(); //freeFish functie wordt pas bij +10 punten uitgevoerd
					scoreboardbucket.score += 1; //Bucket wordt per soortgenoot gevuld met 1 punt
					scoreboard.score = 0; //Score wordt gereset
					removeChild(scoretext);
					addChild(addtext);
					friendSFX.play(0, 1);
					
				}				

				if (scoreboardbucket.score == 2)
				{
					_spawnTimer2.addEventListener(TimerEvent.TIMER, spawnBlowFish);
					var bgColor:ColorTransform = new ColorTransform(1, 1, 1, 1, 50, 0, 0, 200);
			backgroundA.transform.colorTransform = bgColor;
					
				}
				
				if (scoreboardbucket.score == 4)
				{
					_spawnTimer3.addEventListener(TimerEvent.TIMER, spawnShark);
					var bgColor:ColorTransform = new ColorTransform(1, 1, 1, 1, 0, 50, 0, 200);
			backgroundA.transform.colorTransform = bgColor;
				}
				
			}
			
			
			//IF PLAYER HITS FOOD
			for (var f:int = _food.length -1; f >= 0; f--)
				{	
					 
        			if (_food[f].hitTestObject(player))
					{	
						
						//trace("Werk");
						this.removeChild(_food[f]);
						_food.splice(f, 1);
						scoreboard.score += 1;
						player.scaleX = player.scaleY += Math.abs(0.02);
						biggerSFX.play(0, 1);
						eatSFX.play(0, 1);
					}
				}
			//IF PLAYER HITS FOOD
			
			
			if (scoreboard.score == 0)
			{
				player.scaleX = player.scaleY = Math.abs(0.2); //Player scale reset
			}
			
			if (scoreboard.score == 1)
			{
				
				
			
			
				//prison.visible = false;
				//addChild(cageexplosion);
				
				//cageexplosion.x = 400;
				//cageexplosion.y = 400;
				
			}
			
			if (scoreboard.score == 2)
			{
				
			}
			
			if (scoreboard.score == 20)
			{
				if (_spawnTimer.hasEventListener(TimerEvent.TIMER))
				{
					shoot = false;
					addChild(endscreen);
					soundChannel.stop();
					_removeGame();
				}
			}
			
		
		}
		
		private function scoreText():void
		{
			scoretext = new TextField();
			scoretext.defaultTextFormat = new TextFormat("MyFont",20,0xFF0000,true);
			scoretext.width = _stage.stageWidth;
			scoretext.text = "FREE YOUR ALLIES!";
			scoretext.embedFonts = true;
			
			scoretext.x = 380;
			scoretext.y = 150;
		}
		
		
		private function addText():void
		{
			addtext = new TextField();
			addtext.defaultTextFormat = new TextFormat("MyFont",20,0x00FF00,true);
			addtext.width = _stage.stageWidth;
			addtext.text = "+1";
			addtext.embedFonts = true;
			
			addtext.x = 380;
			addtext.y = 150;
		}
		
		
		private function freeFish():void
		{
				//trace("bevrijd");
				friend = new Hostage();
				addChild(friend);
				
				friend.scaleX = friend.scaleY = 0.2;
				
				friend.x = _stage.stageWidth / 2;
				friend.y = _stage.stageHeight / 2.5;
			
		}
 
	
		
		private function fishEaten():void 
		{
			scoreboard = new scoreBoard;
			addChild(scoreboard);
			
			scoreboard.y = 500;
			scoreboard.x = 0;
			scoreboard.scaleX = scoreboard.scaleY = 0.8;
			
			scoreboardbucket = new scoreBoardBucket;
			addChild(scoreboardbucket);
			
			scoreboardbucket.y = 550;
			scoreboardbucket.x = 0;
			scoreboard.scaleX = scoreboard.scaleY = 0.8;
		}
		
		private function hitPlayer():void
		{
			for (var p:int = _asteroids.length - 1; p >= 0; p--)
			{
					if (p >= _asteroids.length) continue;
					 
        			if (_asteroids[p].hitTestObject(player))
					{	
						trace("test");
					}
			}
		}
		
		
		
		
		public function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.ESCAPE:
				
				if (_spawnTimer.hasEventListener(TimerEvent.TIMER))
				{
					backgroundA.unloadAndStop();
					ispause = true;
					eatSFX.play(0, 1);
					shoot = false;
					addChild(pause);
					_spawnTimer.removeEventListener(TimerEvent.TIMER, spawnAsteroid);
					_spawnTimer2.removeEventListener(TimerEvent.TIMER, spawnAsteroid);
					_stage.removeEventListener(Event.ENTER_FRAME, update);
					mute.volume = 0;
					SoundMixer.soundTransform = mute;
				}
				else
				{
					backgroundA.load(backgroundURL);
					ispause = false;
					shoot = true;
					removeChild(pause);
					_spawnTimer.addEventListener(TimerEvent.TIMER, spawnAsteroid);
					_stage.addEventListener(Event.ENTER_FRAME, update);
					mute.volume = 1;
					SoundMixer.soundTransform = mute;
				}					
			}
			if (shoot == true && _shootCoolDown == false)
			{
				if (event.keyCode == 32)
				{
					var newBullet:Bullet = _bulletFactory.createBullet(player.rotation);
					newBullet.x = player.x;
					newBullet.y = player.y;
					addChild(newBullet);
					_bullets.push(newBullet);
					bulletSFX.play(0, 1);		
					_shootCoolDown = true;
					_ShootTimer.start();
				}
			}
		}
 
	}
 
}