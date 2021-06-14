import std.stdio;
import core.thread;
import server;

void main()
{
	Server _server = new Server();

	auto tid = new Thread(() {
		_server.run();
	}).start();
}
