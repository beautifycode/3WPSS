package com.lucee.lucy {
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import com.demonsters.debugger.MonsterDebugger;
	import com.lucee.lucy.configs.LucyConfig;
	import com.lucee.lucy.views.ApplicationView;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	/**
	 * @author marvin
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="720", height="400")];
	public class Lucy extends Sprite {
		private var _contextView : ContextView;
		private var _context : IContext;
		private var _applicationView : ApplicationView;

		public function Lucy() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			MonsterDebugger.initialize(this);

			_contextView = new ContextView(this);
			_context = new Context()
				.install(MVCSBundle)
				.configure(LucyConfig, _contextView);
		}
	}
}
