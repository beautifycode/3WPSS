package com.lucee.iosclient.views.views.components {
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class MainMenuButton extends Sprite {
		private var _itemName : DefaultTextfield;
		private var _title : String;

		public function MainMenuButton() {
			_itemName = new DefaultTextfield();
			_itemName.setText("---");

			addChild(_itemName);
		}

		public function set title(title : String) : void {
			_title = title;
			_itemName.setText(_title);
		}
	}
}
