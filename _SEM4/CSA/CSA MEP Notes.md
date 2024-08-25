## Grundlagen
### Indexer

```cs
public int this[int i] { // set method omitted => read-only
	get { return apples[i-1] + bananas[i-1]; }
}
```

### Delegates

- In C: Funktionspointer
- A delegate variable can hold multiple methods at the same time

Syntax delegate type:
```cs
delegate void Notifier (string sender)

void SayHello(string sender){
	Console.WriteLine("Hello from " + sender);
}

Notifier greetings = new Notifier(SayHello) // or just greetings = SayHello

greetings("John");
```

### Events

- Special Delegate Field
- Only the class that declares the event can fire it (better encapsulation)
- Other classes may change event fields only with `+=` or `-=` (but not with '=')
- `public event Notifier notifyViews;`

## Multithreading

- Starten: mit `Start()`
- Beendet wenn: Ende von Methode, Exception, Abort von aussen

### Synchronisation, lock-construct, Blockierung

Lock zusammen mit `Monitor`:
```cs
Object x = new Object();
lock (x) {
	try {
		Monitor.Wait(x);
	}
	catch (ThreadInterruptedException) {}
}
lock (x) {
	Monitor.Pulse(x); // aufwecken
}
```

- Lock kann auch ohne `Monitor` verwendet werden.
- Ist einfach aber manchmal genügend
- filler
- filler

### Lebenszyklus

![[thread_lebenszyklus.png]]

| Begriff           | Bedeutung                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| new               | Das Thread-Objekt ist erzeugt, aber noch nicht gestartet.                                                                                                                                                                                                                                                                                                                                                                                                     |
| ready             | Der Thread ist gestartet, lokal Speicher (Stack) ist zugeteilt, er wartet nur noch auf die Zuweisung des Prozessors.                                                                                                                                                                                                                                                                                                                                          |
| running           | Der Thread führt seine Anweisungen auf dem Prozessor aus.                                                                                                                                                                                                                                                                                                                                                                                                     |
| stopped           | Der Thread existiert nicht mehr. Das Thread-Objekt jedoch schon und kann, falls es referenziert ist, benutzt werden. Andernfalls wird es vom Garbage Collector entfernt.                                                                                                                                                                                                                                                                                      |
| abort             | Kann durch `ResetAbort` wieder zu `running` gehen.                                                                                                                                                                                                                                                                                                                                                                                                            |
| blocked           | Der Thread muss warten, bis eine Bedingung erfüllt wird. Dies sind: Warten auf den Ablauf einer gewissen Zeit oder Ende eines anderen Threads. Ein Thread kann auch in den Zustand «blocked» gelangen, wenn eine Betriebssystemroutine aufgerufen wird. Das geschieht beispielsweise bei File-Operationen. Sollte von einem Stream gelesen werden und sind noch keine Daten vorhanden, so kann das Betriebssystem den Thread in den «blocked» Zustand führen. |
| objects lock-pool | jedes Objekt hat genau einen. Geht hinein wenn `lock` erhalten?                                                                                                                                                                                                                                                                                                                                                                                               |
| objects wait-pool | wait-pool und lock-pool müssen zum gleichen Objekt gehören. Pool wenn `Monitor.Wait(x)` aufgerufen wird.                                                                                                                                                                                                                                                                                                                                                      |

### Synchronisierungsereignisse

- Semaphore können von anderen Aktivitätsträgern wieder freigegeben werden 
- Der Thread, welcher Mutex besitzt muss diesen auch freigeben.

**Semaphores:**
```cs
private static readonly Semaphore sema = new Semaphore(3, 3);
new Thread(Go).Start(i);
static void Go(object number) {
		sema.WaitOne(); // critical section starts
		Thread.Sleep(1000); // Only 3 threads can get here at once
		sema.Release(); // critical section end
	}
}
```

**Mutex:**
```cs
// Wait 5 seconds if contended in case other instance is in shutdown
if (!mutex.WaitOne(TimeSpan.FromSeconds(5), false)) {
	Console.WriteLine("Another instance of the app is running.");
	return;
}
try { something }
finally { mutex.ReleaseMutex();}
```

## Streams

**Drei Operationen:**
- In Stream schreiben
- Aus Stream lesen
- **Wahlfreier Zugriff:** ganzer Stream auslesen nicht immer notwendig
- **Base-Streams** - direkt aus Strom Daten lesen oder schreiben
- **Pass-Through-Streams** - ergänzen Base-Stream um spezielle Funktionalitäten

Handle streams inside a `using` statement like this:
```csharp
using (StreamWriter sw = new StreamWriter("data.txt"), System.Text.Encoding.UTF8){
	sw.WriteLine("Hello there");
}
```
Then the memory gets properly free'd

## Sockets

**Funktionalitäten:**
- Verbindung zu Prozess aufbauen
- Daten senden
- Daten empfangen
- Verbindung beenden
- Einen Port / Applikation binden
- An einem Port auf Verbindungswunsch hören
- Verbindungswunsch akzeptieren / ablehnen

### Server Socket

```csharp
try {
	IPAddress ip = Dns.GetHostEntry("raspberrypi").AddressList[0];
	TcpListener listen = new TcpListener(ip, 420);
	listen.Start();
	while (true){
		using (TcpClient client = listen.AcceptTcpClient()) {
			Console.WriteLine("client-ip: {0}", client.Client.RemoteEndPoint);
			StreamWriter sw = new StreamWriter(client.GetStream());
			sw.WriteLine("Zur Zeit: {0}", DateTime.Now.ToString());
			sw.Flush();
		}
	}
}
```

### Client

Verbinden mit:
`TcpClient client = new TcpClient("<IP>", port);`
und schreiben wie beim Beispiel oben beim Server mit Stream

### Iterativ vs nebenläufiger Server

- Iterativ: "single-threaded", sehr einfach, Beispiel oben bei [[#Server Socket]]
- nebenläufig: macht Sinn, wenn Auftrag lange dauert, Listener (Master) startet für jede Anfrage einen neuen Task (Slave)

Beispiel:
*iterativ nehmen aber anstatt `StreamWriter` zu erzeugen diese Linien einfügen: *
```cs
EchoHandler handler = new EchoHandler(client);
new Thread(handler.SendStuff).Start();
```

separate Klasse:
```cs
public class EchoHandler {
	private TcpClient client;
	public EchoHandler(TcpClient client) {
		this.client = client;
	}
	public void SendStuff(){
		// same sending stuff as in iterative
	}
}
```

