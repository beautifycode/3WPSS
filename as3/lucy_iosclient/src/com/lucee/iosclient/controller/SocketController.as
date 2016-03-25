package com.lucee.iosclient.controller {
	import com.lucee.iosclient.events.SocketDataEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.Socket;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.ui.Keyboard;

	/**
	 * @author marvin
	 */
	public class SocketController {
		[Inject]
		public var event : SocketDataEvent;

		[Inject]
		public var eventDispatcher : IEventDispatcher;
		
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.137";
		private var _pathDataSocket : Socket = new Socket();
		private var _stringToSend : String;

		public function initialize() : void {
			eventDispatcher.addEventListener(SocketDataEvent.SEND_DATA, onSocketSendData);
		}

		private function onSocketSendData(event : SocketDataEvent) : void {
			_stringToSend = event.data;
		}

		private function sendString(_string : String = "") : void {
			var s : String = _string;
			if (_stringToSend) s = _stringToSend;
			
			_pathDataSocket.connect(HOST_IP, HOST_PORT);
			_pathDataSocket.addEventListener(Event.CONNECT, onConnected);

			if (_pathDataSocket.connected) {
				_pathDataSocket.writeUTFBytes(s);
				_pathDataSocket.flush();

				// @TODO: Fix this reconnect bug.
				_pathDataSocket.close();
				_pathDataSocket.connect(HOST_IP, HOST_PORT);
			}
		}

		private function onConnected(event : Event) : void {
			sendString();
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
	}
}
