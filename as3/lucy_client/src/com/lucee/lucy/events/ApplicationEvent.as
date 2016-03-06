package com.lucee.lucy.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class ApplicationEvent extends Event {
		public function ApplicationEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
