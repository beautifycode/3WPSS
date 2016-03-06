package com.lucee.tasktrayhelper {
	import com.demonsters.debugger.MonsterDebugger;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.Socket;

	/**
	 * @author mbl
	 */
	public class TasktrayHelper extends Sprite {
		private static const HOST_PORT : uint = 7777;
		private static const HOST_IP : String = "192.168.2.120";
		
		private var _pathDataSocket : Socket = new Socket();
		private var _process : NativeProcess;
		private var _processInfo : NativeProcessStartupInfo;
		private var _processArgs : Vector.<String>;

		private var _file : File;
		private var _msocket : Socket;
		private var _msg : String;
		private var _messageArr : Array;

		public function TasktrayHelper() {
			MonsterDebugger.initialize(this);
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			_pathDataSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			_pathDataSocket.connect(HOST_IP, HOST_PORT);
		}

		private function executeArrayMessage(message : Array) : void {
			_processInfo = new  NativeProcessStartupInfo();
			_file = File.applicationDirectory.resolvePath("nircmd.exe");
			_processInfo.executable = _file;
			_processArgs = new  Vector.<String>();
			_processArgs.push(message[0]);
			_processArgs.push(message[1]);
			_processInfo.arguments = _processArgs;
			_process = new  NativeProcess();
			_process.start(_processInfo);
		}

		private function handleSocketData(event : ProgressEvent) : void {
			_msocket = Socket(event.target);
			_msg = _msocket.readUTFBytes(_msocket.bytesAvailable);
			_messageArr = _msg.split(" ");
			if (_messageArr.length == 2) executeArrayMessage(_messageArr);
			else trace("Needs two parameters.");
		}
	}
}

