package com.lucee.iosclient.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class ApplicationEvent extends Event {
		public static const BOOT : String = "boot";
		public static const BOOT_COMPLETE : String = "bootComplete";
		public static const BACK_BTN_CLICKED : String = "backBtnClicked";

		public function ApplicationEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
