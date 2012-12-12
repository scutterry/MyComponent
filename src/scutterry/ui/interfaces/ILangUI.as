package scutterry.ui.interfaces
{
	public interface ILangUI
	{
		/**
		 * 读取语言。支持替换如： 你是{0}称号，下一级为{1}称号 
		 * @param p_key 对应的主键
		 * @param args 替换动态参数
		 * @return 
		 * 
		 */		
		function getLang(p_key:String, ...args):String;
	}
}