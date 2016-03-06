package com.lucee.commandsender {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
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
		private var pathDataSocket : Socket = new Socket();
		private var userInput : TextField;

		public function CommandSender() {
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			// pathDataSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			pathDataSocket.connect(HOST_IP, HOST_PORT);

			userInput = new TextField();
			userInput.border = true;
			userInput.type = TextFieldType.INPUT;
			userInput.addEventListener(KeyboardEvent.KEY_DOWN, onKeyHandler);
			addChild(userInput);
		}

		private function onKeyHandler(event : KeyboardEvent) : void {
			if (event.keyCode == Keyboard.ENTER) {
				sendHello();
			}
		}

		private function sendHello() : void {
			var s : String = userInput.text;
			pathDataSocket.connect(HOST_IP, HOST_PORT);

			if (pathDataSocket.connected) {
				pathDataSocket.writeUTFBytes(s);
				pathDataSocket.flush();

				// @TODO: Fix this reconnect bug.
				pathDataSocket.close();
			}

			userInput.text = "";
		}
	}
}
