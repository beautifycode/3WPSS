package com.lucee.iosclient.views.views.components {
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class PresetsMenuButton extends Sprite {
		private var _itemName : DefaultTextfield;
		private var _itemDescription : DefaultTextfield;
		private var _title : String;
		private var _description : String;

		public function PresetsMenuButton() {
			_itemName = new DefaultTextfield();
			_itemName.setText("---");
			_itemName.x = 20;
			
			_itemDescription = new DefaultTextfield();
			_itemDescription.setText("---");
			_itemDescription.y = 100;
			_itemDescription.x = 20;

			addChild(_itemName);
			addChild(_itemDescription);
		}

		public function set title(title : String) : void {
			_title = title;
			_itemName.setText(_title);
		}
		
		public function set description(description : String) : void {
			_description = description;
			_itemDescription.setText(_description);
		}
	}
}
