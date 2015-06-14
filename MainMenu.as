package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.geom.ColorTransform;
	
 /**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
 
	 public class MainMenu extends Sprite
	 {
		 [Embed(source = "../lib/background2.png")]
		 private var MainImage:Class;
		private var main:Bitmap;

		 private var playbutton:PlayButton;
		 private var howtoplaybutton:HowToPlayButton;
		 private var creditsbutton:CreditsButton;
		 private var backbutton:BackButton;
		 private var backbutton2:BackButton;
		 private var backbutton3:BackButton;
		 private var nextbutton:NextButton;
		 
		 private var mute:SoundTransform;
		 
		 private var logo:LogoArt;
	  
		private var game:Main;
		private var counter:Number = 0;
		
		
		//***HOW TO PLAY ASSETS***
		private var player:AplayerArt;
		private var player2:AplayerArt;
		private var energy: EnemyArt;
		private var enemy: AEnemyArt;
		private var blowfish:BlowFishArt;
		private var shark: SharkArt;
		private var prison: PrisonArt;
		private var howtoplayimage: HTPImage;
		private var howtoplayimage2: HTPImage2;
		private var cage:PrisonArt;
		//***HOW TO PLAY ASSETS***
	  
		//***CREDITS***
		private var creditstext:CreditsArt;
		//***CREDITS***
		
	  //private var cutOST: Sound;
	 // private var soundChannel: SoundChannel;
  
	 private var PcolorTimer:int;
	 
	 //***SFX***
		private var menuSFX:Sound;
		private var clickSFX:Sound;
		private var backSFX:Sound;
		private var MsoundChannel:SoundChannel;
	 //***SFX***
	  public function MainMenu():void
	  {
		
		MsoundChannel = new SoundChannel();
		  
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		menuSFX = new Sound();
		menuSFX.load(new URLRequest("../audio/menu.mp3"));
		
		MsoundChannel = menuSFX.play(1, 5);
		
		main = new MainImage();
		addChild(main);
		
		//main.width = stage.stageWidth;
		//main.height = stage.stageHeight;
		
		logo = new LogoArt();
		addChild(logo);
		logo.x = stage.stageWidth / 2;
		logo.y = 200;
		
		logo.scaleX = logo.scaleY = 0.7;
		
		playbutton = new PlayButton();
		addChild(playbutton);
		
		playbutton.x = 400;
		playbutton.y = 400;
		
		
		howtoplaybutton = new HowToPlayButton();
		addChild(howtoplaybutton);
		
		howtoplaybutton.x = 600;
		howtoplaybutton.y = 400;
		
		creditsbutton = new CreditsButton();
		addChild(creditsbutton);
		
		creditsbutton.x = 500;
		creditsbutton.y = 500;
		
		backbutton = new BackButton();
		backbutton2 = new BackButton();
		backbutton3 = new BackButton();
		player = new AplayerArt();
		player2 = new AplayerArt();
		energy = new EnemyArt();
		blowfish = new BlowFishArt();
		enemy = new AEnemyArt();
		nextbutton = new NextButton();
		howtoplayimage = new HTPImage();
		howtoplayimage2 = new HTPImage2();
		cage = new PrisonArt;
		
		creditstext = new CreditsArt();

		clickSFX = new Sound();
		clickSFX.load(new URLRequest("../audio/button.mp3"));
		
		backSFX = new Sound();
		backSFX.load(new URLRequest("../audio/back.mp3"));
	  }
  
	  private function init(e:Event = null):void 
	  {
			stage.addEventListener(Event.ENTER_FRAME, update);
			playbutton.addEventListener(MouseEvent.CLICK, play);
			howtoplaybutton.addEventListener(MouseEvent.CLICK, howtoplay);
			creditsbutton.addEventListener(MouseEvent.CLICK, credits);
			nextbutton.addEventListener(MouseEvent.CLICK, next);
			 
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
	  }
	  
			
			private function update(e:Event):void
			{
				main.scaleY += 0.0001;
				main.scaleX += 0.0001;
				
				if (nextbutton.hasEventListener(MouseEvent.CLICK))
				{
					PcolorTimer--;
			
			if (PcolorTimer <= 0)
			{
				var PmyColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
				player2.transform.colorTransform = PmyColor;
				PcolorTimer = 5;
			}			
				}
			}
			
	  private function play(e:MouseEvent):void
	  {

		if (counter == 0)
		{
			//mute.volume = 0;
			//SoundMixer.soundTransform = mute;
			clickSFX.play(1, 0);
			removeChild(main);
			removeChild(logo);
			removeChild(playbutton);
			removeChild(howtoplaybutton);
			removeChild(creditsbutton);
			
			counter = 1;
			game = new Main();
			addChild(game);
			MsoundChannel.stop();

		}
	  }
	  private function howtoplay(e:MouseEvent):void
	  {
		  
		  
		  addChild(howtoplayimage);
		  
		  howtoplayimage.y = 305;
		  howtoplayimage.x = 570;
		  
		  removeChild(logo);
		 removeChild(playbutton);
		 removeChild(howtoplaybutton);
		 removeChild(creditsbutton);
		 
		 
		  addChild(backbutton);
		  
		  backbutton.x = 100;
		  backbutton.y = 100;
		  
		  backbutton.addEventListener(MouseEvent.CLICK, back);
		 
		  addChild(player);
		  
		  player.x = 300;
		  player.y = 100;
		  
		  player.scaleX = player.scaleY = 0.4;
		  
		  addChild(enemy);
		  
		  enemy.x = 300;
		  enemy.y = 300; 
		  
		  enemy.scaleX = enemy.scaleY = 0.4;
		  
		  addChild(blowfish);
		  
		  blowfish.x = 400;
		  blowfish.y = 300;
		  
		  blowfish.scaleX = blowfish.scaleY = 0.3;
		  
		  addChild(energy);
		  
		  energy.x = 300;
		  energy.y = 500;
		  
		  energy.scaleX = energy.scaleY = 0.2;
		  
		  addChild(nextbutton);
		  
		  nextbutton.x = 950;
		  nextbutton.y = 300;
		  
		  nextbutton.scaleX = nextbutton.scaleY = 0.5;
		  
		  if (nextbutton.visible == false)
		  {
			  nextbutton.visible = true;
		  }
		  
		  clickSFX.play(1, 0);
	
	  }
	  
	  
	  private function next(e:MouseEvent):void
	  {
		  
		  removeChild(backbutton);
		 removeChild(player);
		 removeChild(enemy);
		 removeChild(blowfish);
		 removeChild(energy);
		 removeChild(howtoplayimage);
		 
		 addChild(howtoplayimage2);
		  
		  howtoplayimage2.y = 305;
		  howtoplayimage2.x = 570;
		 
		  addChild(cage);
		  
		  cage.x = 700;
		  cage.y = 100;
		 addChild(backbutton3); 
		 
		  addChild(player2);
		  
		  player2.x = 500;
		  player2.y = 100;
		  
		  player2.scaleX = player2.scaleY = 0.4;
		 

		 backbutton3.x = 100;
		 backbutton3.y = 100;
		 backbutton3.addEventListener(MouseEvent.CLICK, back3);
		 
		 nextbutton.visible = false;
		 
	  }
	  
	  private function credits(e:MouseEvent):void
	  {
		  addChild(backbutton2);
		  
		  backbutton2.x = 100;
		  backbutton2.y = 100;
		  
		  addChild(creditstext);
		  
		  creditstext.y = 305;
		  creditstext.x = 600;
		  
		  backbutton2.addEventListener(MouseEvent.CLICK, back2);
		  
		 removeChild(logo);
		 removeChild(playbutton);
		 removeChild(howtoplaybutton);
		 removeChild(creditsbutton);
		 
		 clickSFX.play(1, 0);
	  }
	  
	  private function back(e:MouseEvent):void //HOW TO PLAY BACK BUTTON
	  {
		  addChild(logo);
		  addChild(howtoplaybutton);
		  addChild(playbutton);
		  addChild(creditsbutton);
		  removeChild(backbutton);
		  removeChild(player);
		  removeChild(enemy);
		  removeChild(energy);
		  removeChild(howtoplayimage);
		  removeChild(nextbutton);
		  removeChild(blowfish);
		  
		  backSFX.play(1, 0);
	  }
	  
	    private function back2(e:MouseEvent):void //CREDITS BACK BUTTON
	  {
		  addChild(logo);
		  addChild(howtoplaybutton);
		  addChild(playbutton);
		  addChild(creditsbutton);
		  removeChild(backbutton2);
		  removeChild(creditstext);
		  
		  backSFX.play(1, 0);
	  }
	  
	  private function back3(e:MouseEvent):void //HOW TO PLAY BACK BUTTON
	  {
		  addChild(logo);
		  addChild(howtoplaybutton);
		  addChild(playbutton);
		  addChild(creditsbutton);
		  removeChild(backbutton3);
		  removeChild(nextbutton);
		  removeChild(howtoplayimage2);
		  removeChild(cage);
		  removeChild(player2);
		  
		  backSFX.play(1, 0);
	  }
	}  

}