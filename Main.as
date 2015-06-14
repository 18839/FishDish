/*
 * 30-4-2015
 * DIT IS VOOR NU DE NIEUWE MAIN
 * SCOREBOARD EN BACKGROUND TOEGEVOEGD
 * - FERRY
 */

package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Bitmap;
	import flash.geom.ColorTransform;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
 
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	
	public class Main extends Sprite
	{
		private var _game:Game;
		private var _endscreen:Endscreen;
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{	
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			_game = new Game(this.stage, endGame);
			
			addChild(_game);
		}
		
		private function onKeyUp(e:KeyboardEvent ):void
		{
			if (e.keyCode == Keyboard.ESCAPE)
			{
				if (stage.hasEventListener(Event.ENTER_FRAME))
				{
					stage.removeEventListener(Event.ENTER_FRAME, update);
					
					
				}
				else
				{
					stage.addEventListener(Event.ENTER_FRAME, update);
				}
				
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (_game != null)
			{
				_game.onKeyDown(e);
			}
			
			if (e.keyCode == 32 && _endscreen != null && _game == null)
			{	
				removeChild(_endscreen);
				_endscreen = null;
				createGame();
			}
			
		}
		
		public function update(e:Event):void 
		{
			if (_game != null)
			{
				_game.update(e);			
			}
		}
		
		private function endGame():void
		{
			removeChild(_game);
			_game = null;
			_endscreen = new Endscreen();
			addChild(_endscreen);
		}
		
		private function createGame():void
		{
			_game = new Game(this.stage, endGame);
			addChild(_game);
		}
		
		
 
	}
}
