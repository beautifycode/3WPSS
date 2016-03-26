package com.lucee.iosclient.views.views.components.textfields {
	import flash.text.TextFormatAlign;

	/**
	 * @author marvin
	 */
	public class MainMenuTextfield extends DefaultTextfield {
		public function MainMenuTextfield() {
			_textformat.letterSpacing = 13;
			_textformat.size = 68;
			_textformat.align = TextFormatAlign.CENTER;
			
			initialize();
		}
	}
}
