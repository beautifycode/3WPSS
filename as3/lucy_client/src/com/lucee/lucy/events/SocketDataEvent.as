package com.lucee.lucy.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class SocketDataEvent extends Event {
		public function SocketDataEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
