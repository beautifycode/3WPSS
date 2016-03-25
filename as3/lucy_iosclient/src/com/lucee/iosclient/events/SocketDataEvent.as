package com.lucee.iosclient.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class SocketDataEvent extends Event {
		public static const SEND_DATA : String = "sendData";
		public var data : String;

		public function SocketDataEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event {
			var e:SocketDataEvent = new SocketDataEvent(this.type, this.bubbles, this.cancelable);
			e.data = this.data;
			
			return e;
		}
	}
}
