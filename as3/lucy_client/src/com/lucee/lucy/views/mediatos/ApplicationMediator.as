package com.lucee.lucy.views.mediatos {
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.lucee.lucy.events.ApplicationEvent;
	import com.lucee.lucy.views.views.ApplicationView;

	/**
	 * @author marvin
	 */
	public class ApplicationMediator extends Mediator {
		[Inject]
		public var view : ApplicationView;

		override public function initialize() : void {
			addContextListener(ApplicationEvent.BOOT_COMPLETE, _onBootFinished);

		}

		private function _onBootFinished(event : ApplicationEvent) : void {
			view.build();
		}
	}
}
