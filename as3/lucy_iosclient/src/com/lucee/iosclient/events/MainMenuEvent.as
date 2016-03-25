package com.lucee.iosclient.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class MainMenuEvent extends Event {
		public static const PRESETS_CLICKED : String = "presetsClicked";
		public static const DEVICES_CLICKED : String = "devicesClicked";

		public function MainMenuEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		
	}
}
