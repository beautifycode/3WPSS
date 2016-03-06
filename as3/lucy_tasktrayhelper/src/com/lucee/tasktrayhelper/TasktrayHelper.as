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
		private var pathDataSocket : Socket = new Socket();
		private var process : NativeProcess;

		public function TasktrayHelper() {
			MonsterDebugger.initialize(this);
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			pathDataSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			pathDataSocket.connect(HOST_IP, HOST_PORT);
		}

		private function handleSocketData(event : ProgressEvent) : void {
			var target : Socket = Socket(event.target);
			var message : String = target.readUTFBytes(target.bytesAvailable);
			trace('message: ' + (message));
			execute(message);
		}

		private function execute(message : String) : void {
			var nativeProcessStartupInfo = new  NativeProcessStartupInfo();
			var file:File = File.applicationDirectory.resolvePath("nircmd.exe");
			trace(file.nativePath);
			nativeProcessStartupInfo.executable = file;
			var processArgs = new  Vector.<String>();
			processArgs.push(message);
			nativeProcessStartupInfo.arguments = processArgs;
			process = new  NativeProcess();
			process.start(nativeProcessStartupInfo);
		}
	}
}

