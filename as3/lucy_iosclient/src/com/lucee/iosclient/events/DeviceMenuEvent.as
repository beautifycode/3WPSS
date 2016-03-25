package com.lucee.iosclient.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class DeviceMenuEvent extends Event {
		public static const STEHLAMPE_CLICKED : String = "stehlampeClicked";

		public function DeviceMenuEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		
	}
}
