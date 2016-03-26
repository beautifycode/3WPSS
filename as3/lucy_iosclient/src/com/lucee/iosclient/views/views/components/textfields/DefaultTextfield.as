package com.lucee.iosclient.views.views.components.textfields {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author marvin
	 */
	public class DefaultTextfield extends Sprite {
		public var _textformat : TextFormat;
		public var _textfield : TextField;
		public var _font : ElegantLux;

		public function DefaultTextfield() {
			_font = new ElegantLux();
			_textformat = new TextFormat();
			_textfield = new TextField();
		}

		public function setText(string : String) : void {
			_textfield.text = string;
		}

		protected function initialize() : void {
			_textformat.font = _font.fontName;
			_textformat.color = 0xFFFFFF;

			_textfield.defaultTextFormat = _textformat;
			_textfield.selectable = false;
			_textfield.embedFonts = true;
			_textfield.width = 750;
			_textfield.height = 86;

			addChild(_textfield);
		}
		// public function setRightStyle() : void {
		// _textformat.align = TextFormatAlign.RIGHT;
		// _textfield.defaultTextFormat = _textformat;
		// _textfield.setTextFormat(_textformat);
		// _textfield.width = 720;
		// _textfield.x = 0;
		// }
	}
}
