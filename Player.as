package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */

		public class Player extends Sprite
		{
			private var player:AplayerArt;
				
			// ***PLAYER STATS***
			private var maxSpeed:Number = 5;
			private var rotationSpeed:Number = 7;
			private var thrust:Number = .5;
			private var decay:Number = .97;
	 
			private var currentSpeed:Number = 0;
			private var speedX:Number = 0;
			private var speedY:Number = 0;
			// ***PLAYER STATS***
	 
			//***MOVEMENT***
			private var movingUp:Boolean = false;
			private var movingLeft:Boolean = false;
			private var movingRight:Boolean = false;
			//***MOVEMENT***
		
		
			public function Player()
			{	
				
				//FUNCTIONS
				createPlayer();
				addEventListener(Event.ENTER_FRAME, update);
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
			}
			
			private function init(e:Event = null):void
			{
				removeEventListener(Event.ADDED_TO_STAGE, init);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			}
			
			private function createPlayer():void
			{
				player = new AplayerArt();
				this.addChild(player);	
			}

			private function update(event:Event):void
			{
				if (movingRight)
				{
					this.rotation += rotationSpeed;
				}
				if (movingLeft)
				{
					this.rotation -= rotationSpeed;
				}
				if (movingUp)
				{
					speedX += thrust * Math.sin(this.rotation * (Math.PI / 180));
					speedY += thrust * Math.cos(this.rotation * (Math.PI / 180));
				}
				else
				{
					// Langzamer naarmate keyUP bezig is
					speedX *= decay;
					speedY *= decay;
				}
				
				
				
			
				
	 
				// Limiet
				currentSpeed = Math.sqrt((speedX * speedX) + (speedY * speedY));
	 
				if (currentSpeed > maxSpeed)
				{
					speedX *= maxSpeed/currentSpeed;
					speedY *= maxSpeed/currentSpeed;
				}
	 
				this.y -= speedY;
				this.x += speedX;
			}
			
			
			private function onKeyDown(event:KeyboardEvent):void
			{
				switch(event.keyCode)
				{
					case Keyboard.UP:
						movingUp = true;
						break;
	 
					case Keyboard.LEFT:
						movingLeft = true;
						break;
	 
					case Keyboard.RIGHT:
						movingRight = true;
						break;
					
					case Keyboard.ESCAPE:
					
					if (hasEventListener(Event.ENTER_FRAME))
					{
						removeEventListener(Event.ENTER_FRAME, update);
					}
					
					else
					{
						addEventListener(Event.ENTER_FRAME, update);
					}	
				}
			}

			private function onKeyUp(event:KeyboardEvent):void
			{
				switch( event.keyCode )
				{
					case Keyboard.UP:
						movingUp = false;
						break;
	 
					case Keyboard.LEFT:
						movingLeft = false;
						break;
	 
					case Keyboard.RIGHT:
						movingRight = false;
						break;
					
				}
				
			}
 
		}
 
}
