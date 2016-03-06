package com.lucee.lucy.views.views {
	import flash.display.Sprite;

	/**
	 * @author marvin
	 */
	public class VolumeView extends Sprite {
		private var _incVolBtn:Sprite;
		private var _decVolBtn:Sprite;
		
		public function VolumeView() {
			_incVolBtn = new Sprite();
			_incVolBtn.graphics.beginFill(0xFF0000);
			_incVolBtn.graphics.drawRect(0, 0, 50, 50);
			_incVolBtn.x = 0;
			_incVolBtn.y = 0;
			addChild(_incVolBtn);
			
			_decVolBtn = new Sprite();
			_decVolBtn.graphics.beginFill(0xFF0000);
			_decVolBtn.graphics.drawRect(0, 0, 50, 50);
			_decVolBtn.x = 80;
			_decVolBtn.y = 0;
			addChild(_decVolBtn);
		}
	}
}
