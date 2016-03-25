package com.lucee.iosclient.configs {
	import com.lucee.iosclient.views.mediatos.IphoneHeaderMediator;
	import com.lucee.iosclient.views.views.IPhoneHeaderView;
	import com.lucee.iosclient.views.mediatos.MainMenuMediator;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	import com.lucee.iosclient.commands.macros.BootMacro;
	import com.lucee.iosclient.controller.SocketController;
	import com.lucee.iosclient.events.ApplicationEvent;
	import com.lucee.iosclient.models.ApplicationModel;
	import com.lucee.iosclient.views.mediatos.ApplicationMediator;
	import com.lucee.iosclient.views.views.ApplicationView;
	import com.lucee.iosclient.views.views.MainMenuView;

	import flash.desktop.NativeApplication;
	import flash.events.IEventDispatcher;
	import flash.events.InvokeEvent;

	/**
	 * @author marvin
	 */
	public class LucyConfig implements IConfig {
		[Inject]
		public var injectormap : IInjector;

		[Inject]
		public var commandmap : IEventCommandMap;

		[Inject]
		public var mediatormap : IMediatorMap;

		[Inject]
		public var context : IContext;

		[Inject]
		public var eventDispatcher : IEventDispatcher;
		private var _applicationEvent : ApplicationEvent;


		public function configure() : void {
			commandmap.map(ApplicationEvent.BOOT).toCommand(BootMacro);
			injectormap.map(ApplicationModel).asSingleton();

//			var socketController = new SocketController();
			injectormap.map(SocketController).asSingleton();

			mediatormap.map(ApplicationView).toMediator(ApplicationMediator);
			mediatormap.map(MainMenuView).toMediator(MainMenuMediator);
			mediatormap.map(IPhoneHeaderView).toMediator(IphoneHeaderMediator);
			context.afterInitializing(_init);
		}

		private function _init() : void {
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, _onAppInvoke);
		}

		private function _onAppInvoke(event : InvokeEvent) : void {
			_applicationEvent = new ApplicationEvent(ApplicationEvent.BOOT, true, false);
			eventDispatcher.dispatchEvent(_applicationEvent);
		}
	}
}
