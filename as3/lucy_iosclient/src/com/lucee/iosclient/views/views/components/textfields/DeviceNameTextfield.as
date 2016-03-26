package com.lucee.iosclient.views.views.components.textfields {
	import flash.text.TextFormatAlign;

	/**
	 * @author marvin
	 */
	public class DeviceNameTextfield extends DefaultTextfield {

		public function DeviceNameTextfield() {
			_textformat.size = 40;
			_textformat.letterSpacing = 6;
			_textformat.align = TextFormatAlign.LEFT;

			_textfield.x = 40;

			initialize();
		}
	}
}
