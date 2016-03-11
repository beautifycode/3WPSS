package com.lucee.lucy.views.mediatos {
	import com.lucee.lucy.events.VolumeEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.lucee.lucy.views.views.VolumeView;

	import flash.events.MouseEvent;

	/**
	 * @author marvin
	 */
	public class VolumeViewMediator extends Mediator {
		[Inject]
		public var view : VolumeView;

		override public function initialize() : void {
			view.incVolBtn.addEventListener(MouseEvent.CLICK, onIncVolume);
			view.decVolBtn.addEventListener(MouseEvent.CLICK, onDecVolume);
		}

		private function onDecVolume(event : MouseEvent) : void {
		}

		private function onIncVolume(event : MouseEvent) : void {
			volumeEvent = new VolumeEvent(VolumeEvent.INCREASE_VOLUME);
		}
	}
}
