module server;

import core.stdc.string : strlen;
import std.algorithm.searching;
import std.stdio;
import std.conv;
import std.socket;
import core.thread;


class Server : Thread
{
	Socket listener;
	Socket[] clients;
	char[1096] buffer;
	SocketSet readSet;

	this()
	{
		this.listener = new Socket(AddressFamily.INET, SocketType.STREAM);
		this.readSet = new SocketSet();
		this.listener.bind(new InternetAddress("127.0.0.1", 1985));
		this.listener.listen(10);

		super(&run);
	}

	void run()
	{
		for ( ;; )
		{
			this.readSet.reset();
			this.readSet.add(this.listener);

			foreach (client; this.clients) this.readSet.add(client);

			if (Socket.select(this.readSet, this.readSet, null))
			{
				foreach (client; this.clients)
				{
					if (!this.readSet.isSet(client))
						continue;

					client.send("\nping\n");
					auto pong = client.receive(this.buffer);
					auto strBuffer = this.buffer[0..pong].to!string();

					if (canFind(strBuffer, "pong"))
					{
						client.send("\nping\n");
					}
					else
					{
						if (strBuffer.length > 2)
						{
							writeln(strBuffer);
						}
					}
				}
				if (this.readSet.isSet(this.listener))
				{
					auto newSocket = this.listener.accept();
					newSocket.send("Tunnel Snakes RULE!");
					this.clients ~= newSocket;
				}
			}
		}
	}
}
