package com.lucee.commandsender {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;

	/**
	 * @author mbl
	 */
	public class CommandSender extends Sprite {
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.120";

		private var _pathDataSocket : Socket = new Socket();
		private var _userInputTextField : TextField;

		public function CommandSender() {
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			_pathDataSocket.connect(HOST_IP, HOST_PORT);

			_userInputTextField = new TextField();
			_userInputTextField.border = true;
			_userInputTextField.type = TextFieldType.INPUT;
			_userInputTextField.addEventListener(KeyboardEvent.KEY_DOWN, onKeyHandler);
			addChild(_userInputTextField);
		}

		private function onKeyHandler(event : KeyboardEvent) : void {
			if (event.keyCode == Keyboard.ENTER) {
				sendString();
			}
		}

		private function sendString() : void {
			var s : String = _userInputTextField.text;

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
