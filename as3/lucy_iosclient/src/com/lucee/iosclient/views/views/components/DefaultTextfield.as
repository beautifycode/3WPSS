package com.lucee.iosclient.views.views.components {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author marvin
	 */
	public class DefaultTextfield extends Sprite {
		private var _textformat : TextFormat;
		private var _textfield : TextField;
		private var _font : ElegantLux;

		public function DefaultTextfield() {
			_font = new ElegantLux();

			_textformat = new TextFormat();
			_textformat.letterSpacing = 13;

			_textformat.size = 68;
			_textformat.align = TextFormatAlign.CENTER;
			_textformat.font = _font.fontName;
			_textformat.color = 0xFFFFFF;

			_textfield = new TextField();
			_textfield.selectable = false;
			_textfield.embedFonts = true;
			_textfield.width = 750;
			_textfield.height = 86;
			_textfield.defaultTextFormat = _textformat;

			addChild(_textfield);
		}

		public function setText(string : String) : void {
			_textfield.text = string;
		}

		public function setLeftStyle() : void {
			_textformat.align = TextFormatAlign.LEFT;
			_textformat.size = 40;
			_textformat.letterSpacing = 6;
			_textfield.defaultTextFormat = _textformat;
			_textfield.setTextFormat(_textformat);
			_textfield.x = 40;
		}

		public function setRightStyle() : void {
			_textformat.align = TextFormatAlign.RIGHT;
			_textfield.defaultTextFormat = _textformat;
			_textfield.setTextFormat(_textformat);
			_textfield.width = 720;
			_textfield.x = 0;
		}

		public function setDescStyle() : void {
			_textformat.align = TextFormatAlign.LEFT;
			_textformat.size = 28;
			_textformat.letterSpacing = 6;
			_textfield.defaultTextFormat = _textformat;
			_textfield.setTextFormat(_textformat);
			_textfield.x = 40;
			_textfield.y = 60;
		}

		public function setHeaderStyle() : void {
			_textformat.size = 48;
			_textformat.letterSpacing = 6;
			_textfield.defaultTextFormat = _textformat;
			_textfield.setTextFormat(_textformat);
		}
	}
}
