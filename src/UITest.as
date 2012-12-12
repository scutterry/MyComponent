package
{
	import com.bit101.components.PushButton;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	import org.bytearray.display.ScaleBitmapSprite;
	
	import scutterry.ui.component.MyButton;
	
	public class UITest extends Sprite
	{
		private var down:BitmapData;
		private var over:BitmapData;
		
		private var lw:int = 1;
		private var rw:int = 1;
		private var lh:int = 1;
		private var rh:int = 1;
		private var button:MyButton;
		public function UITest()
		{
			
			button = new MyButton;
			button.enabled = true;
			this.addChild(button);
			loadImg("xButton2_down.png");
			loadImg("xButton2_over.png");
			loadImg("xButton2_up.png");
			var b:PushButton = new PushButton;
			b.label = "Button";
			b.x = 200;
			this.addChild(b);
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function loadImg(p_path:String):void{
			var loader:Loader = new Loader;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(p_path));
		}
		
		private function onComplete(p_event:Event):void{
			var li:LoaderInfo = p_event.target as LoaderInfo;
			li.removeEventListener(Event.COMPLETE, onComplete);
			if (li.url.indexOf("xButton2_down.png") != -1){
				down = (li.content as Bitmap).bitmapData;
				
				button.downSkin = down;
			} else if(li.url.indexOf("xButton2_over.png") != -1){
				over = (li.content as Bitmap).bitmapData;
				button.overSkin = over;
			} else {
				button.upSkin = (li.content as Bitmap).bitmapData;
			}
			
		}
		private function onClick(p_event:Event):void{
			var w:int = 20 + 100 * Math.random();
			var h:int = 20 + 100 * Math.random();
			button.width = 82;
			button.height = 27;
		}
		
	}//end class
}