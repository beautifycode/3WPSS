package com.lucee.lucy.configs {
	import com.lucee.lucy.views.mediatos.ApplicationMediator;
	import com.lucee.lucy.views.ApplicationView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	import flash.events.IEventDispatcher;
	/**
	 * @author marvin
	 */
	public class LucyConfig {
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
		

		public function configure() : void {
			mediatormap.map(ApplicationView).toMediator(ApplicationMediator);
		}
	}
}
