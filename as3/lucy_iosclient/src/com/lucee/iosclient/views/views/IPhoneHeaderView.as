package com.lucee.iosclient.views.views {
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	import com.lucee.iosclient.views.views.components.textfields.TitleTextfield;

	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class IPhoneHeaderView extends Sprite {
		private var _background : Sprite = new Sprite();
		private var _headerHeight : int = 150;
		private var _backButton : Sprite;
		private var _backButtonBitmap : Bitmap;
		private var _title : TitleTextfield;

		public function IPhoneHeaderView() {
			_background = new Sprite();
			_background.graphics.beginFill(0x1b1f20);
			_background.graphics.drawRect(0, 0, 750, _headerHeight);
			_background.y = -_headerHeight;

			_backButtonBitmap = new Bitmap(new AssetBackButton());
			_backButtonBitmap.smoothing = true;

			_backButton = new Sprite();
			_backButton.y = 60;
			_backButton.x = 10;
			_backButton.alpha = 0;
			_backButton.addChild(_backButtonBitmap);
			_backButton.width = _backButton.height = 80;

			_title = new TitleTextfield();
			_title.setText("DEVICES");
			_title.y = 60;
			_title.alpha = 0;

			addChild(_background);
			addChild(_title);
			addChild(_backButton);
		}

		public function hide() : void {
			TweenLite.to(_backButton, .25, {x:10, alpha:0});
			TweenLite.to(_background, 1, {y:-_headerHeight, ease:Strong.easeIn, delay:.55});
			TweenLite.to(_title, 1, {alpha:0, y:58, delay:.25});
		}

		public function show() : void {
			TweenLite.to(_backButton, .25, {x:20, alpha:1, delay:.75});
			TweenLite.to(_title, 1, {alpha:1, y:68, delay:.55});
			TweenLite.to(_background, 1, {y:0, onComplete:showBackAndTitle, ease:Strong.easeOut});
		}

		private function showBackAndTitle() : void {
		}

		public function get backButton() : Sprite {
			return _backButton;
		}
	}
}
