package com.lucee.iosclient.views.views.components.textfields {
	import flash.text.TextFormatAlign;

	/**
	 * @author marvin
	 */
	public class TitleTextfield extends DefaultTextfield {
		public function TitleTextfield() {
			_textformat.letterSpacing = 4;
			_textformat.size = 42;
			_textformat.align = TextFormatAlign.CENTER;

			initialize();
		}
	}
}
