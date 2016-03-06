package com.lucee.tasktrayhelper {
	import flash.display.NativeWindow;
	import flash.system.Capabilities;
	import com.demonsters.debugger.MonsterDebugger;

	import flash.desktop.DockIcon;
	import flash.desktop.NativeApplication;
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.desktop.SystemTrayIcon;
	import flash.display.Loader;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.Socket;
	import flash.net.URLRequest;

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
			setupTrayIcon();
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			_pathDataSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			_pathDataSocket.connect(HOST_IP, HOST_PORT);
		}

		private function setupTrayIcon() : void {
			if (Capabilities.isDebugger)
				return;

			NativeApplication.nativeApplication.autoExit = false;
			var icon : Loader = new Loader();
			var iconMenu : NativeMenu = new NativeMenu();
			var exitCommand : NativeMenuItem = iconMenu.addItem(new NativeMenuItem("Exit"));
			exitCommand.addEventListener(Event.SELECT, function(event : Event) : void {
				NativeApplication.nativeApplication.icon.bitmaps = [];
				NativeApplication.nativeApplication.exit();
			});

			if (NativeApplication.supportsSystemTrayIcon) {
				NativeApplication.nativeApplication.autoExit = false;
				icon.contentLoaderInfo.addEventListener(Event.COMPLETE, iconLoadComplete);
				_file = File.applicationDirectory.resolvePath("AppIcons/16x16-AIRApp_16.png");
				icon.load(new URLRequest(_file.nativePath));
				var systray : SystemTrayIcon = NativeApplication.nativeApplication.icon as SystemTrayIcon;
				systray.tooltip = "Lucy Helper";
				systray.menu = iconMenu;
			}

			if (NativeApplication.supportsDockIcon) {
				icon.contentLoaderInfo.addEventListener(Event.COMPLETE, iconLoadComplete);
				_file = File.applicationDirectory.resolvePath("AppIcons/128x128-AIRApp_128.png");
				icon.load(new URLRequest(_file.nativePath));
				var dock : DockIcon = NativeApplication.nativeApplication.icon as DockIcon;
				dock.menu = iconMenu;
			}
		}

		private function iconLoadComplete(event : Event) : void {
			NativeApplication.nativeApplication.icon.bitmaps = [event.target.content.bitmapData];
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
		}
	}
}

