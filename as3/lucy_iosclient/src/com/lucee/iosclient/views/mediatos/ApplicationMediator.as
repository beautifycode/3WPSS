package com.lucee.iosclient.views.mediatos {
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.lucee.iosclient.events.ApplicationEvent;
	import com.lucee.iosclient.events.MainMenuEvent;
	import com.lucee.iosclient.views.views.ApplicationView;

	import flash.events.Event;

	/**
	 * @author marvin
	 */
	public class ApplicationMediator extends Mediator {
		[Inject]
		public var view : ApplicationView;

		override public function initialize() : void {
			addContextListener(ApplicationEvent.BOOT_COMPLETE, _onBootFinished);
			addContextListener(MainMenuEvent.PRESETS_CLICKED, _onMenuItemClicked);
			addContextListener(MainMenuEvent.DEVICES_CLICKED, _onMenuItemClicked);
			addContextListener(ApplicationEvent.BACK_BTN_CLICKED, _onMenuItemClicked);
		}

		private function _onMenuItemClicked(event : Event) : void {
			switch (event.type) {
				case MainMenuEvent.PRESETS_CLICKED:
					view.showPresets();
					break;
					
				case MainMenuEvent.DEVICES_CLICKED:
					view.showDevices();
					break;
					
				case ApplicationEvent.BACK_BTN_CLICKED:
					view.showMainMenu();
					break;
			}
		}

		private function _onBootFinished(event : ApplicationEvent) : void {
			view.build();
		}
	}
}
