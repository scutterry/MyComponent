package scutterry.ui.component
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.bytearray.display.ScaleBitmapSprite;
	
	import scutterry.ui.core.InteractUI;
	
	public class MyButton extends InteractUI
	{
		private var overSkinSprite:Sprite;
		private var upSkinSprite:Sprite;
		private var downSkinSprite:Sprite;
		
		private var _overSkin:BitmapData;
		private var _upSkin:BitmapData;
		private var _downSkin:BitmapData;
		
		private var isUpSkinChanged:Boolean;
		private var isOverSkinChanged:Boolean;
		private var isDownSkinChanged:Boolean;
		
		private var isDown:Boolean = false;
		private var isScale9Grid:Boolean = true;
		
		private var label:LangLabel;
		
		
		private var paddingTop:Number = 2;
		private var paddingLeft:Number = 0;
		private var paddingRight:Number = 0;
		private var paddingBottom:Number = 0;
		
		public function MyButton()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			label = new LangLabel();
			this.addChild(label);
			label.text = "Button";
		}
		
		override protected function doOut():void{
			if (!isDown){
				styleUp();
			}
			
		}
		
		
		
		override protected function doOver():void{
			if (!isDown){
				styleOver();
			}
		}
		
		private function styleUp():void{
			upSkinSprite.visible = true;
			overSkinSprite.visible = !upSkinSprite.visible;
			downSkinSprite.visible = !upSkinSprite.visible;
		}
		
		private function styleOver():void{
			overSkinSprite.visible = true;
			upSkinSprite.visible = !overSkinSprite.visible;
			downSkinSprite.visible = !overSkinSprite.visible;
		}
		
		private function styleDown():void{
			downSkinSprite.visible = true;
			upSkinSprite.visible = !downSkinSprite.visible;
			overSkinSprite.visible = !downSkinSprite.visible;
		}
		
		
		override public function draw():void{
			if (this.isUpSkinChanged){
				if (this.isScale9Grid){
					this.upSkinSprite = createSkin(this._upSkin);
				}
				isUpSkinChanged = false;
				width = this._upSkin.width;
				height = this._upSkin.height;
			}
			
			if (this.isDownSkinChanged){
				isDownSkinChanged = false;
				if (this.isScale9Grid){
					this.downSkinSprite = createSkin(this._downSkin);
				}
			}
			
			if (this.isOverSkinChanged){
				isOverSkinChanged = false;
				if (this.isScale9Grid){
					this.overSkinSprite = createSkin(this._overSkin);
					
				}
			}
			label.x = ((this.width - label.width) >> 1) - paddingLeft + paddingRight;
			label.y = ((this.height - label.height) >> 1) - paddingTop + paddingBottom;
		}
		
		
		private function createSkin(p_bitmapData:BitmapData):Sprite{
			var tempSprite:ScaleBitmapSprite = new ScaleBitmapSprite(p_bitmapData, true);
			tempSprite.width = this._width;
			if (!this.contains(tempSprite)){
				this.addChildAt(tempSprite, 0);
			}
			return tempSprite;
		}
		
		
		private function onDown(p_event:MouseEvent):void{
			isDown = true;
			styleDown();
			stage.addEventListener(MouseEvent.MOUSE_UP, onStageUp);
		}
		
		
		private function onStageUp(p_event:MouseEvent):void{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onStageUp);
			isDown = false;
			if (isOver){
				this.styleOver();
			} else{
				this.styleUp();
			}
		}

		public function get overSkin():BitmapData
		{
			return _overSkin;
		}

		public function set overSkin(value:BitmapData):void
		{
			_overSkin = value;
			this.isOverSkinChanged = true;
			this.invalidate();
		}

		public function get upSkin():BitmapData
		{
			return _upSkin;
		}

		public function set upSkin(value:BitmapData):void
		{
			_upSkin = value;
			this.isUpSkinChanged = true;
			this.invalidate();
		}

		public function get downSkin():BitmapData
		{
			return _downSkin;
		}

		public function set downSkin(value:BitmapData):void
		{
			_downSkin = value;
			this.isDownSkinChanged = true;
			this.invalidate();
		}

		
	}//end class
}