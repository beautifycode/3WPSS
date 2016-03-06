package com.lucee.lucy.views {
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class ApplicationView extends Sprite {
		public function ApplicationView() {
			var circle:Sprite =new Sprite();
			circle.graphics.beginFill(0xF00000);
			circle.graphics.drawCircle(0, 0, 200);
			addChild(circle);
		}
	}
}
