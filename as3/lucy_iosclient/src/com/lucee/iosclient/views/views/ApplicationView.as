package com.lucee.iosclient.views.views {
	import flash.display.Sprite;
	import flash.events.TransformGestureEvent;
	import flash.utils.setTimeout;

	/**
	 * @author marvin
	 */
	public class ApplicationView extends Sprite {
		private var _mainMenuView : MainMenuView;
		private var _presetView : PresetView;
		private var _bootView : BootView;
		private static var CROSSFADE_TIME : int = 1.5;
		private var _applicationBackground : ApplicationBackground;
		private var _oldInterface : OldInterfaceView;
		private var _deviceView : DeviceView;
		private var _headerView : IPhoneHeaderView;

		public function ApplicationView() {
		}

		public function build() : void {
			_applicationBackground = new ApplicationBackground();
			_bootView = new BootView();
			_mainMenuView = new MainMenuView();
			_presetView = new PresetView();
			_deviceView = new DeviceView();
			_headerView = new IPhoneHeaderView();
			// _oldInterface = new OldInterfaceView();

			addChild(_applicationBackground);
			addChild(_bootView);
			addChild(_mainMenuView);
			addChild(_presetView);
			addChild(_deviceView);
			addChild(_headerView);
			// addChild(_oldInterface);

			showBootScreen();
			enableSwipe();
		}

		private function enableSwipe() : void {
			addEventListener(TransformGestureEvent.GESTURE_SWIPE, onSwipe);


		}

		private function onSwipe(event : TransformGestureEvent) : void {
			if (event.offsetX == 1) {
				// User swiped towards right
				showMainMenu(true);
			}
		}

		private function showBootScreen() : void {
			_bootView.show();
			setTimeout(showMainMenu, 1000);
		}

		public function showMainMenu(bySwipe:Boolean=false) : void {
			_bootView.hide();
			_presetView.hide();
			_deviceView.hideBySwipe();
			// _timersView.hide();
			_headerView.hide();
			_mainMenuView.show(1);

		}

		public function showPresets() : void {
			_mainMenuView.hide();
			_headerView.show();
			_presetView.show();
		}

		public function showTimers() : void {
		}

		public function showDevices() : void {
			_mainMenuView.hide();
			_deviceView.show(.7);
			_headerView.show();
		}
	}
}
