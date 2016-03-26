package com.lucee.iosclient.services {
	import flash.net.Socket;
	/**
	 * @author marvin
	 */
	public class SocketConnectionService extends Object {
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.120";

		private var _pathDataSocket : Socket = new Socket();

		public function SocketConnectionService() {
			_pathDataSocket.connect(HOST_IP, HOST_PORT);
		}
	}
}
