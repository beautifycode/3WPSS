package com.lucee.iosclient.views.views {
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;

	/**
	 * @author marvin
	 */
	public class OldInterfaceView extends Sprite {
		private var _appContainer : Sprite;
		private var _appBackground : ApplicationBackground;
		private var _presetsMenuBtn : MenuButton;
		private var _eventsMenuBtn : MenuButton;
		private var _tf : TextFormat;
		private var _mainMenu : Sprite;
		private var _devicesMenuBtn : MenuButton;
		private var _netflixPresetBtn : PresetButton;
		private var _spotifyPresetBtn : PresetButton;
		private var _sleepPresetBtn : PresetButton;
		private var _presetMenu : Sprite;
		private var _loadingBtn : MenuButton;
		private var _iosHeader : IphoneHeader;

		public function OldInterfaceView() {
			setupOldInterface();
		}

		private function setupOldInterface() : void {
			_appContainer = new Sprite();
			_appContainer.x = 0;

			_appBackground = new ApplicationBackground();
			_appBackground.x = _appBackground.y = 0;

			_tf = new TextFormat();
			_tf.letterSpacing = 13;

			_appContainer.addChild(_appBackground);
			setupControls();
			setupPresets();

			addChild(_appContainer);

			_loadingBtn = new MenuButton();
			_loadingBtn.id = "presets";
			_loadingBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_loadingBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_loadingBtn.title.text = "LOADING";
			_loadingBtn.title.setTextFormat(_tf);
			_loadingBtn.x = 0;
			_loadingBtn.y = 550;

			_appContainer.addChild(_loadingBtn);

			_iosHeader = new IphoneHeader();
			_iosHeader.y = -150;
			_iosHeader.backBtn.addEventListener(MouseEvent.CLICK, onBackBtnClick);
			addChild(_iosHeader);

			TweenLite.to(_loadingBtn, 1.5, {y:520, autoAlpha:0, ease:Strong.easeIn, delay:1.5});
			setTimeout(showMainaMenu, 3000);
		}

		private function onBackBtnClick(event : MouseEvent) : void {
			hidePresetMenu();
		}

		private function showMainaMenu() : void {
			_presetMenu.visible = false;
			TweenLite.to(_presetsMenuBtn, 1.5, {y:50, alpha:1, ease:Strong.easeOut});
			TweenLite.to(_eventsMenuBtn, 1.5, {y:200, alpha:1, ease:Strong.easeOut, delay:.3});
			TweenLite.to(_devicesMenuBtn, 1.5, {y:350, alpha:1, ease:Strong.easeOut, delay:.5});
		}

		private function hideMainMenu() : void {
			TweenLite.to(_presetsMenuBtn, .5, {y:20, alpha:0, ease:Strong.easeIn, onComplete:showPresetMenu});
			TweenLite.to(_eventsMenuBtn, .5, {y:170, alpha:0, ease:Strong.easeIn, delay:.5});
			TweenLite.to(_devicesMenuBtn, .5, {y:320, alpha:0, ease:Strong.easeIn, delay:.8});
		}

		private function showPresetMenu() : void {
			_presetMenu.visible = true;
			showBackBtn();

			TweenLite.to(_netflixPresetBtn, 1.5, {y:0, alpha:1, ease:Strong.easeOut, delay:0});
			TweenLite.to(_spotifyPresetBtn, 1.5, {y:234, alpha:1, ease:Strong.easeOut, delay:0.7});
			TweenLite.to(_sleepPresetBtn, 1.5, {y:468, alpha:1, ease:Strong.easeOut, delay:1.1});
		}

		private function showBackBtn() : void {
			TweenLite.to(_iosHeader, 1, {y:0, ease:Strong.easeOut});
		}

		private function hidePresetMenu() : void {
			TweenLite.to(_netflixPresetBtn, .5, {y:-20, alpha:0, ease:Strong.easeIn});
			TweenLite.to(_spotifyPresetBtn, .5, {y:210, alpha:0, ease:Strong.easeIn, delay:.3});
			TweenLite.to(_sleepPresetBtn, .5, {y:442, alpha:0, ease:Strong.easeIn, delay:0.7, onComplete:showMainaMenu});

			TweenLite.to(_iosHeader, 1, {y:-150, ease:Strong.easeIn});
		}

		private function setupControls() : void {
			_presetsMenuBtn = new MenuButton();
			_presetsMenuBtn.id = "presets";
			_presetsMenuBtn.x = 300;
			_presetsMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_presetsMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_presetsMenuBtn.title.text = "PRESETS";
			_presetsMenuBtn.title.setTextFormat(_tf);
			_presetsMenuBtn.x = 0;
			_presetsMenuBtn.y = 70;
			_presetsMenuBtn.alpha = 0;

			_eventsMenuBtn = new MenuButton();
			_eventsMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_eventsMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_eventsMenuBtn.id = "timers";
			_eventsMenuBtn.title.text = "TIMERS";
			_eventsMenuBtn.title.setTextFormat(_tf);
			_eventsMenuBtn.x = 0;
			_eventsMenuBtn.y = 220;
			_eventsMenuBtn.alpha = 0;

			_devicesMenuBtn = new MenuButton();
			_devicesMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_devicesMenuBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_devicesMenuBtn.title.text = "DEVICES";
			_devicesMenuBtn.title.setTextFormat(_tf);
			_devicesMenuBtn.id = "devices";
			_devicesMenuBtn.x = 0;
			_devicesMenuBtn.y = 370;
			_devicesMenuBtn.alpha = 0;

			_mainMenu = new Sprite();
			_mainMenu.y = 450;
			_mainMenu.addEventListener(MouseEvent.CLICK, onClick);

			_mainMenu.addChild(_devicesMenuBtn);
			_mainMenu.addChild(_presetsMenuBtn);
			_mainMenu.addChild(_eventsMenuBtn);
			_appContainer.addChild(_mainMenu);
		}

		private function onClick(event : MouseEvent) : void {
			trace('event.target.parent.id: ' + (event.target.parent.id));
			if (event.target.parent.id == "presets") {
				hideMainMenu();
			}
		}

		private function setupPresets() : void {
			_netflixPresetBtn = new PresetButton();
			_netflixPresetBtn.id = "netflix";
			_netflixPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_netflixPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_netflixPresetBtn.title.text = "NETFLIX";
			_netflixPresetBtn.desc.text = "Starts TV & Uses FireTV Stick Input\nDims Lights\nActivate Full Sound";
			_netflixPresetBtn.title.setTextFormat(_tf);
			_netflixPresetBtn.x = 0;
			_netflixPresetBtn.y = 20;
			_netflixPresetBtn.alpha = 0;

			_spotifyPresetBtn = new PresetButton();
			_spotifyPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_spotifyPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_spotifyPresetBtn.title.text = "SPOTIFY";
			_spotifyPresetBtn.desc.text = "Opens random Spotify playlist\nPowers Speakers\nSet Master Volume";

			_spotifyPresetBtn.title.setTextFormat(_tf);
			_spotifyPresetBtn.x = 0;
			_spotifyPresetBtn.y = 250;
			_spotifyPresetBtn.alpha = 0;

			_sleepPresetBtn = new PresetButton();
			_sleepPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			_sleepPresetBtn.clicker.addEventListener(TouchEvent.TOUCH_END, onTouchEnd_presetsMenuBtn);
			_sleepPresetBtn.title.text = "GOTO SLEEP";
			_sleepPresetBtn.desc.text = "Dims Lights and TV\nSets TV to 60Min";

			_sleepPresetBtn.title.setTextFormat(_tf);
			_sleepPresetBtn.x = 0;
			_sleepPresetBtn.y = 480;
			_sleepPresetBtn.alpha = 0;

			_presetMenu = new Sprite();
			_presetMenu.y = 200;

			_presetMenu.addChild(_netflixPresetBtn);
			_presetMenu.addChild(_spotifyPresetBtn);
			_presetMenu.addChild(_sleepPresetBtn);

			_appContainer.addChild(_presetMenu);
		}

		private function onTouchEnd_presetsMenuBtn(event : TouchEvent) : void {
			// event.target.parent.btnAni_bg.alpha = 0;

			if (event.target.parent.id == "presets") {
				hideMainMenu();
			}
		}

		private function onTouchBegin(event : TouchEvent) : void {
			// event.target.parent.btnAni_bg.alpha = 0.2;
		}
	}
}
