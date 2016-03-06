package com.lucee.lucy.configs {
	import com.lucee.lucy.models.ApplicationModel;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	import com.lucee.lucy.commands.macros.BootMacro;
	import com.lucee.lucy.events.ApplicationEvent;
	import com.lucee.lucy.views.ApplicationView;
	import com.lucee.lucy.views.mediatos.ApplicationMediator;

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
			
			mediatormap.map(ApplicationView).toMediator(ApplicationMediator);
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
