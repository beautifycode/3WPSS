# TTH + CS
The TaskTrayHelper is a functional toolkit based around nircmd. It connects to Lucy's Socketconnection and is able to fulfill systemcommands like:
* Changing volume
* Turning monitors off
* Shutdown your PC
* Open tabs in Chrome
* See all commands: http://www.nirsoft.net/utils/nircmd.html

The CommandSender is a simple tool to send commands to Lucy's Socketconnection. Similiar to the tcp_talkclient.pl but as a standalone application.

Built with Love, Perl 5.22 and Adobe AIR 20.

Currently supported: Udoobuntu, Windows 7, Mac OSX

# How to use
* Start tcp_multiserver
* Start TTH on the PC to be controlled
* Start CS on your client
* Send a command, e.g. "mutesysvolume 0"

# Author
Marvin Blase

# Changelog
### 0.1.0
- Basic communication functionality

# License
Copyright (c) <2016> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
