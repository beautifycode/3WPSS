package com.lucee.iosclient.views.views.components.textfields {
	import flash.text.TextFormatAlign;

	/**
	 * @author marvin
	 */
	public class DeviceDescriptionTextfield extends DefaultTextfield {

		public function DeviceDescriptionTextfield() {
			_textformat.size = 28;
			_textformat.letterSpacing = 6;
			_textformat.align = TextFormatAlign.LEFT;

			_textfield.x = 40;
			_textfield.y = 60;

			initialize();
		}
	}
}
