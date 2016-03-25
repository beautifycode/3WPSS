package com.lucee.iosclient.views.mediatos {
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.lucee.iosclient.events.DeviceMenuEvent;
	import com.lucee.iosclient.views.views.DeviceView;

	import flash.events.MouseEvent;

	/**
	 * @author marvin
	 */
	public class DeviceViewMediator extends Mediator {
		 [Inject]
		 public var view:DeviceView;
		 

		 
		override public function initialize() : void {
			view.stehlampeDevice.addEventListener(MouseEvent.CLICK, _onBtnClick);
			// addContextListener(ApplicationEvent.BOOT_COMPLETE, _onBootFinished);
		}

		private function _onBtnClick(event : MouseEvent) : void {
			eventDispatcher.dispatchEvent(new DeviceMenuEvent(DeviceMenuEvent.STEHLAMPE_CLICKED, true, false));
		}
	}
}
