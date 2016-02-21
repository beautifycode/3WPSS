package 
{
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
	public class PerlSocket extends Sprite
	{
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.120";

		private var pathDataSocket : Socket = new Socket();
		private var userInput : TextField;

		public function PerlSocket()
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			pathDataSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			pathDataSocket.connect(HOST_IP, HOST_PORT);

			userInput = new TextField();
			userInput.type = TextFieldType.INPUT;
			userInput.addEventListener(KeyboardEvent.KEY_DOWN, onKeyHandler);
			addChild(userInput);
		}

		private function onKeyHandler(event : KeyboardEvent) : void
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				sendHello();
			}
		}

		private function sendHello() : void
		{
			var s : String = userInput.text;
			
			if (pathDataSocket.connected)
			{
				pathDataSocket.writeUTFBytes(s);
				pathDataSocket.flush();
				
				// @TODO: Fix this reconnect bug.
				pathDataSocket.close();
				pathDataSocket.connect(HOST_IP, HOST_PORT);
			}

			userInput.text = "";
		}

		private function handleSocketData(event : ProgressEvent) : void
		{
			var target : Socket = Socket(event.target);
			var message : String = target.readUTFBytes(target.bytesAvailable);
			trace(message);
		}
	}
}
