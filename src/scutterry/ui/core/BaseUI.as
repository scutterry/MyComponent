package scutterry.ui.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import scutterry.ui.interfaces.ILangUI;
	
	public class BaseUI extends Sprite
	{
		protected var _width:Number;
		protected var _height:Number;
		private var _isDirty:Boolean = false;
		private var tooltip:String;
		
		private var _enabled:Boolean;
		protected var iLang:ILangUI;
		
		public function BaseUI()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function init():void{
			
		}
		
		public function draw():void{
			
		}
		
		private function onAddedToStage(p_event:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.RENDER, onRender);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			init();
			onRender();
		}
		
		private function onRemoveFromStage(p_event:Event):void{
			this.removeEventListener(Event.RENDER, onRender);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onRender(p_event:Event = null):void{
			if (_isDirty){
				draw();
				_isDirty = false;
				removeEventListener(Event.RENDER, onRender);
			}
			
		}
		
		
		final public function invalidate():void{
			if (!stage)return;
			_isDirty = true;
			stage.invalidate();
			
			if (!this.hasEventListener(Event.RENDER)){
				addEventListener(Event.RENDER, onRender);
			}
			
		}

		public function get isDirty():Boolean
		{
			return _isDirty;
		}
		
		override public function get width():Number{
			return this._width;
		}
		
		override public function set width(value:Number):void{
			if(this._width != value){
				_width = value;
				this.invalidate();
			}
		}
		
		
		override public function get height():Number{
			return this._height;
		}
		
		override public function set height(value:Number):void{
			if(this._height != value){
				_height = value;
				this.invalidate();
			}
		}
		

		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
//			if(_enabled != value){
				mouseEnabled = value;
				this.mouseChildren = value;
				_enabled = value;
				this.invalidate();
//			}
		}
		
		
	}//end class
}