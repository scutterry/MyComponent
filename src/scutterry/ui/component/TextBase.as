package scutterry.ui.component
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import scutterry.ui.consts.LabelTypeConst;
	import scutterry.ui.core.InteractUI;
	
	
	/**
	 * 文本基类 
	 * @author terry
	 * 
	 */	
	public class TextBase extends InteractUI
	{
		protected  var _textField:TextField;
		private var _autoSize:Boolean = true;
		private var _text:String = "";
		
		
		public function TextBase()
		{
			super();
		}
		
		override protected function init():void{
			this.enabled = false;
			_textField = new TextField;
			
			this.addChild(_textField);
			super.init();
		}
		
		override public function draw():void{
			super.draw();
			_textField.text = _text;
			if(_autoSize)
			{
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_width = _textField.width;
				_height = _textField.height;
//				dispatchEvent(new Event(Event.RESIZE));
			}
			else
			{
				_textField.autoSize = TextFieldAutoSize.NONE;
				_textField.width = _width;
				_textField.height = _height;
			}
		}
		
		
		
		public function get textField():TextField{
			return this._textField;
		}
		
		public function get text():String{
			return this._text;
		}
		
		public function set text(p_value:String):void{
			this._text = p_value;
			this.invalidate();
		}
		
		
		public function get labelType():int{
			return LabelTypeConst.LANG_TYPE;
		}

		public function get htmlText():String
		{
			return this._textField.htmlText;
		}

		public function set htmlText(value:String):void
		{
			this._textField.htmlText = value;
		}

		
	}//end class
}