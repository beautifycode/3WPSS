package com.lucee.iosclient.views.views {
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	import com.lucee.iosclient.views.views.components.DefaultTextfield;

	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class BootView extends Sprite {
		private var _loadingTF : DefaultTextfield;

		public function BootView() {
			_loadingTF = new DefaultTextfield();
			_loadingTF.setText("LOADING");
			_loadingTF.y = 550;
			_loadingTF.alpha = 0;

			addChild(_loadingTF);
		}

		public function show(initialDelay : int = 0) : void {
			TweenLite.to(_loadingTF, 1, {y:"-20", autoAlpha:1, ease:Strong.easeOut, delay:initialDelay});
		}

		public function hide() : void {
			TweenLite.to(_loadingTF, 1, {y:"-20", autoAlpha:0, ease:Strong.easeIn});
		}
	}
}
