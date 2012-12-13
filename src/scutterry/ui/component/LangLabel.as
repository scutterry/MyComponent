package scutterry.ui.component
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import scutterry.ui.consts.LabelTypeConst;
	import scutterry.ui.core.InteractUI;
	
	
	/**
	 * 默认是不支持鼠标响应和 不能选取的，提高效率的
	 * <listing 3.0>
	 * mouseChildren = false;
	 * mouseEnabled = false;
	 * </listing>
	 
	 * @author terry
	 * 
	 */	
	public class LangLabel extends TextBase
	{
		private var _langKey:String;
		
		private var _replaceContents:Array;
		public function LangLabel()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			_textField.type = TextFieldType.DYNAMIC;
			_textField.mouseEnabled = false;
		}
		
		override public function draw():void{
			super.draw();
			if (_replaceContents && _replaceContents.length > 0){
				_textField.text = this.iLang.getLang.apply(null, [_langKey].concat(_replaceContents));
			} else{
//				_textField.text = this.iLang.getLang(_langKey);
			}
			
		}

		
		override public function get labelType():int{
			return LabelTypeConst.LANG_TYPE;
		}
		
		
		/**
		 * 对应的语言主键 
		 * @return 
		 * 
		 */		
		public function get langKey():String
		{
			return _langKey;
		}

		public function set langKey(value:String):void
		{
			_langKey = value;
			this.invalidate();
		}

		
		/**
		 * 要替换的内容 
		 * @return 
		 * 
		 */		
		public function get replaceContents():Array
		{
			return _replaceContents;
		}

		public function set replaceContents(value:Array):void
		{
			_replaceContents = value;
			this.invalidate();
		}

		
		
		
		
	}//end class
}