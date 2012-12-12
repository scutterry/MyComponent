package scutterry.ui.core
{
	import flash.events.MouseEvent;

	public class InteractUI extends BaseUI
	{
		private var _isOver:Boolean = false;
		public function InteractUI()
		{
			super();
		}
		
		override protected function init():void{
//			addEventListener(MouseEvent.ROLL_OVER, onOver);
		}
		
		
		private function onOver(p_event:MouseEvent):void{
			addEventListener(MouseEvent.ROLL_OUT, onOut);
			_isOver = true;
			doOver();
		}
		
		private function onOut(p_event:MouseEvent):void{
			removeEventListener(MouseEvent.ROLL_OVER, onOut);
			_isOver = false;
			doOut();
		}

		public function get isOver():Boolean
		{
			return _isOver;
		}
		
		protected function doOver():void{
			
		}
		
		protected function doOut():void{
			
		}
		
		
		override public function set enabled(value:Boolean):void{
			super.enabled = value;
			if (value){
				addEventListener(MouseEvent.ROLL_OVER, onOver);
			} else{
				removeEventListener(MouseEvent.ROLL_OVER, onOver);
			}
		}

		
	}//end class
}