package scutterry.ui.component
{
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import scutterry.ui.consts.LabelTypeConst;
	import scutterry.ui.core.InteractUI;
	
	public class TextInput extends TextBase
	{
		public function TextInput()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			_textField.type = TextFieldType.INPUT;
		}
		
		
		override public function get labelType():int{
			return LabelTypeConst.INPUT;
		}
		
	}//end class
}