package com.lucee.iosclient.views.views.components {
	import com.lucee.iosclient.views.views.components.textfields.DeviceDescriptionTextfield;
	import com.lucee.iosclient.views.views.components.textfields.DeviceNameTextfield;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	/**
	 * @author marvin
	 */
	public class DeviceMenuButton extends Sprite {
		private var _itemName : DeviceNameTextfield;
		private var _title : String;
		private var _lampOnAsset : Sprite;
		private var _lampOffAsset : Sprite;
		private var _background : Sprite;
		private var _itemStatus : DeviceDescriptionTextfield;
		private var _state : *;
		private var _lampOffAssetBitmap : Bitmap;
		private var _lampOnAssetBitmap : Bitmap;
		private var _onReq : String;
		private var _offReq : String;
		public var origY : Number;

		public function DeviceMenuButton() {
			_background = new Sprite();
			_background.graphics.beginFill(0x000000, .3);
			_background.graphics.drawRect(0, 0, 768, 140);

			_itemName = new DeviceNameTextfield();
			_itemName.y = 20;
			_itemName.setText("---");

			_itemStatus = new DeviceDescriptionTextfield();
			_itemStatus.y = 20;
			_itemStatus.setText("---");

			_lampOnAssetBitmap = new Bitmap(new AssetDeviceLampOn());
			_lampOnAsset = new Sprite();
			_lampOnAsset.addEventListener(MouseEvent.CLICK, onLampOnClick);
			_lampOnAsset.x = 540;
			_lampOnAsset.y = 44;
			_lampOnAsset.addChild(_lampOnAssetBitmap);

			_lampOffAssetBitmap = new Bitmap(new AssetDeviceLampOff());
			_lampOffAsset = new Sprite();
			_lampOffAsset.addEventListener(MouseEvent.CLICK, onLampOffClick);
			_lampOffAsset.x = 640;
			_lampOffAsset.y = 44;
			_lampOffAsset.addChild(_lampOffAssetBitmap);

			addChild(_background);
			addChild(_itemName);
			addChild(_itemStatus);
			addChild(_lampOnAsset);
			addChild(_lampOffAsset);
		}

		private function onLampOnClick(event : MouseEvent) : void {
			var ur : URLRequest = new URLRequest(_onReq);
			ur.method = URLRequestMethod.GET;
			var url : URLLoader = new URLLoader();
			url.load(ur);
		}

		private function onLampOffClick(event : MouseEvent) : void {
			var ur : URLRequest = new URLRequest(_offReq);
			ur.method = URLRequestMethod.GET;
			var url : URLLoader = new URLLoader();
			url.load(ur);
		}

		public function set title(title : String) : void {
			_title = title;
			_itemName.setText(_title);
		}

		public function set state(state : String) : void {
			_state = state;
			_itemStatus.setText(_state);
		}

		public function setOnReq(r : String) : void {
			_onReq = r;
		}
		
		public function setOffReq(r : String) : void {
			_offReq = r;
		}
	}
}
