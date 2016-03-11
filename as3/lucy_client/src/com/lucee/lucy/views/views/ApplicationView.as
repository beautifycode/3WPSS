package com.lucee.lucy.views.views {
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class ApplicationView extends Sprite {
		public function ApplicationView() {
			
		}

		public function build() : void {
			var volumeView:VolumeView = new VolumeView();
			addChild(volumeView);
		}
	}
}
