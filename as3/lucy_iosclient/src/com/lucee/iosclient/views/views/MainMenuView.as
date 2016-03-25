package com.lucee.iosclient.views.views {
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	import com.lucee.iosclient.models.AnimationModel;
	import com.lucee.iosclient.views.views.components.MainMenuButton;

	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class MainMenuView extends Sprite {
		private var _presetsButton : MainMenuButton;
		private var _timersButton : MainMenuButton;
		private var _devicesButton : MainMenuButton;

		public function MainMenuView() {
			_presetsButton = new MainMenuButton();
			_presetsButton.title = "PRESETS";
			_presetsButton.y = 500;
			_presetsButton.alpha = 0;

			_timersButton = new MainMenuButton();
			_timersButton.title = "TIMERS";
			_timersButton.y = 650;
			_timersButton.alpha = 0;

			_devicesButton = new MainMenuButton();
			_devicesButton.title = "DEVICES";
			_devicesButton.y = 800;
			_devicesButton.alpha = 0;

			addChild(_presetsButton);
			addChild(_timersButton);
			addChild(_devicesButton);
		}

		public function show(initialDelay : int) : void {
			TweenLite.to(_presetsButton, AnimationModel.FADE_IN_TIME, {y:"-20", autoAlpha:1, ease:Strong.easeOut, delay:initialDelay});
			TweenLite.to(_timersButton, AnimationModel.FADE_IN_TIME, {y:"-20", autoAlpha:1, ease:Strong.easeOut, delay:initialDelay + AnimationModel.ITEM_FADEIN_OFFSET_DELAY});
			TweenLite.to(_devicesButton, AnimationModel.FADE_IN_TIME, {y:"-20", autoAlpha:1, ease:Strong.easeOut, delay:initialDelay + AnimationModel.ITEM_FADEIN_OFFSET_DELAY * 1.5});
		}

		private function repositionItems() : void {
			_timersButton.y = 650;
			_devicesButton.y = 800;
			_presetsButton.y = 500;
		}

		public function hide() : void {
			TweenLite.to(_presetsButton, AnimationModel.FADE_OUT_TIME, {y:"-20", autoAlpha:0, ease:Strong.easeIn});
			TweenLite.to(_timersButton, AnimationModel.FADE_OUT_TIME, {y:"-20", autoAlpha:0, ease:Strong.easeIn, delay:AnimationModel.ITEM_FADEOUT_OFFSET_DELAY});
			TweenLite.to(_devicesButton, AnimationModel.FADE_OUT_TIME, {y:"-20", autoAlpha:0, ease:Strong.easeIn, delay:AnimationModel.ITEM_FADEOUT_OFFSET_DELAY * 1.5, onComplete:repositionItems});
		}

		public function get devicesButton() : MainMenuButton {
			return _devicesButton;
		}

		public function set devicesButton(devicesButton : MainMenuButton) : void {
			_devicesButton = devicesButton;
		}

		public function get timersButton() : MainMenuButton {
			return _timersButton;
		}

		public function set timersButton(timersButton : MainMenuButton) : void {
			_timersButton = timersButton;
		}

		public function get presetsButton() : MainMenuButton {
			return _presetsButton;
		}

		public function set presetsButton(presetsButton : MainMenuButton) : void {
			_presetsButton = presetsButton;
		}
	}
}
