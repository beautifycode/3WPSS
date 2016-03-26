package com.lucee.iosclient.views.mediatos {
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.lucee.iosclient.events.ApplicationEvent;
	import com.lucee.iosclient.views.views.IPhoneHeaderView;

	import flash.events.MouseEvent;

	/**
	 * @author marvin
	 */
	public class IphoneHeaderMediator extends Mediator {
		 [Inject]
		 public var view:IPhoneHeaderView;
		 

		 
		override public function initialize() : void {
			view.backButton.addEventListener(MouseEvent.CLICK, _onBackBtnClick);
			// addContextListener(ApplicationEvent.BOOT_COMPLETE, _onBootFinished);
		}

		private function _onBackBtnClick(event : MouseEvent) : void {
			trace('_onBackBtnClick: ' + (_onBackBtnClick));
			eventDispatcher.dispatchEvent(new ApplicationEvent(ApplicationEvent.BACK_BTN_CLICKED, true, false));
		}
	}
}
