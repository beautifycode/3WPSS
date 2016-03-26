package com.lucee.iosclient {
	import com.greensock.plugins.ThrowPropsPlugin;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.lucee.iosclient.configs.LucyConfig;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Capabilities;

	/**
	 * @author mbl
	 */
		[SWF(backgroundColor="#FFFFFF", frameRate="120")]
	public class Lucy extends Sprite {
		private var _contextView : ContextView;
		private var _context : IContext;
		TweenPlugin.activate([AutoAlphaPlugin,ThrowPropsPlugin]);
		public function Lucy() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			_contextView = new ContextView(this);
			_context = new Context()
				.install(MVCSBundle)
				.configure(LucyConfig, _contextView);

			if (Capabilities.os.search("iPhone") < 0) {
				_contextView.view.scaleX = 0.5;
				_contextView.view.scaleY = 0.5;
			}
		}
	}
}
