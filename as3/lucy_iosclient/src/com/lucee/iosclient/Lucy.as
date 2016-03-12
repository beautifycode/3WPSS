package com.lucee.iosclient {
	import com.bit101.components.PushButton;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.Socket;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;

	/**
	 * @author mbl
	 */
	public class Lucy extends Sprite {
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.120";
		private var _pathDataSocket : Socket = new Socket();
		private var _userInputTextField : TextField;
		private var incVolBtn : PushButton;
		private var decVolBtn : PushButton;
		private var lightOnBtn : PushButton;
		private var lightOffBtn : PushButton;
		private var _appContainer : Sprite;
		private var shutDownBtn : PushButton;
		private var isIphone : Boolean;

		public function Lucy() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			if (Capabilities.os.search("iPhone") >= 0) {
				isIphone = true;
			}

			_pathDataSocket.connect(HOST_IP, HOST_PORT);

			_appContainer = new Sprite();
			_appContainer.x = 0;
			_appContainer.y = isIphone ? 80 : 40;

			_userInputTextField = new TextField();
			_userInputTextField.border = true;
			_userInputTextField.type = TextFieldType.INPUT;
			_userInputTextField.addEventListener(KeyboardEvent.KEY_DOWN, onKeyHandler);
			_userInputTextField.x = 700;
			_userInputTextField.y = 500;
			addChild(_userInputTextField);

			incVolBtn = new PushButton();
			incVolBtn.height = 100;
			incVolBtn.label = "Vol +";

			decVolBtn = new PushButton();
			decVolBtn.height = 100;
			decVolBtn.x = incVolBtn.width + 20;
			decVolBtn.label = "Vol -";

			lightOnBtn = new PushButton();
			lightOnBtn.height = 100;
			lightOnBtn.y = incVolBtn.height + 20;
			lightOnBtn.label = "Light on";

			lightOffBtn = new PushButton();
			lightOffBtn.height = 100;
			lightOffBtn.y = lightOnBtn.y;
			lightOffBtn.x = lightOnBtn.width + 20;
			lightOffBtn.label = "Light off";

			shutDownBtn = new PushButton();
			shutDownBtn.height = 100;
			shutDownBtn.y = lightOnBtn.height + lightOnBtn.y + 40;
			shutDownBtn.label = "PC shutdown";

			incVolBtn.addEventListener(MouseEvent.CLICK, onIncClick);
			decVolBtn.addEventListener(MouseEvent.CLICK, onDecClick);
			lightOnBtn.addEventListener(MouseEvent.CLICK, onLightOnClick);
			shutDownBtn.addEventListener(MouseEvent.CLICK, onShutDownClick);
			lightOffBtn.addEventListener(MouseEvent.CLICK, onLightOffClick);

			_appContainer.addChild(incVolBtn);
			_appContainer.addChild(decVolBtn);
			_appContainer.addChild(lightOnBtn);
			_appContainer.addChild(lightOffBtn);
			_appContainer.addChild(shutDownBtn);

			_appContainer.width = stage.stageWidth;
			_appContainer.scaleY = _appContainer.scaleX;

			addChild(_appContainer);
		}


		private function onLightOnClick(event : MouseEvent) : void {
			var ur : URLRequest = new URLRequest("http://" + HOST_IP + ":8083/fhem?cmd=set%20st1%20on");
			ur.method = URLRequestMethod.GET;
			var url : URLLoader = new URLLoader();
			url.load(ur);
		}

		private function onLightOffClick(event : MouseEvent) : void {
			var ur : URLRequest = new URLRequest("http://" + HOST_IP + ":8083/fhem?cmd=set%20st1%20off");
			ur.method = URLRequestMethod.GET;
			var url : URLLoader = new URLLoader();
			url.load(ur);
		}
		
		private function onShutDownClick(event : MouseEvent) : void {
			sendString("exitwin shutdown");
		}

		private function onDecClick(event : MouseEvent) : void {
			sendString("changesysvolume -3000");
		}

		private function onIncClick(event : MouseEvent) : void {
			sendString("changesysvolume 3000");
		}

		private function onKeyHandler(event : KeyboardEvent) : void {
			if (event.keyCode == Keyboard.ENTER) {
				sendString();
			}
		}

		private function sendString(_string : String = "") : void {
			var s : String = _userInputTextField.text;
			if (_string) s = _string;

			if (_pathDataSocket.connected) {
				_pathDataSocket.writeUTFBytes(s);
				_pathDataSocket.flush();

				// @TODO: Fix this reconnect bug.
				_pathDataSocket.close();
				_pathDataSocket.connect(HOST_IP, HOST_PORT);
			}

			_userInputTextField.text = "";
		}
	}
}
