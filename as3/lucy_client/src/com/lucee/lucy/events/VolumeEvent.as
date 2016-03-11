package com.lucee.lucy.events {
	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class VolumeEvent extends Event {
		public static const INCREASE_VOLUME : String = "increaseVolume";
		public var amount : int;

		// private var _amount : int;
		// private var _type : String;

		public function VolumeEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event {
			var clonedEvent : VolumeEvent = new VolumeEvent(type, bubbles, cancelable);
			if (this.amount) clonedEvent.amount = this.amount;
			return clonedEvent;
		}

	}
}
