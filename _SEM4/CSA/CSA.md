# C Sharp in Action

## MEP

- Schriftlich
- 2 Seiten Notizen
- Nicht open-book
- Grundlagen wichtig:
    - Properties
    - Indexer
    - Delegates
    - Event-Handling
    - Remote Debugging
    - Einfache Linux Administration
    - Hardwarenahe Softwareentwicklung
- Multithreading
    - Lebenszyklus eines Threads
    - Erzeugen, starten, beenden und stoppen
    - Einfache Synchronisation mit einfacher Blockierung und lock-Konstrukt
    - Synchronisierungsereignisse: WaitHandle, Mutex, Semaphore und Monitor mit Wait und Pulse
- Kommunikation mit C# Datenströmen
    - Ein- und Ausgabe-Streams
    - Verknüpfung von Ein- und Ausgabe-Streams mit Quellen und Senken
- Kommunikation mit Sockets
    - Socket Prinzip
    - Einsatz und Eigenschafter der Sockets, bzwe TcpClient
    - Server Socket, bzw. TcpListener
    - das Client-Server Modell und das Konzept, iterativer und nebenläufiger Server
    - http-Server

>[!tip] Kommt garantiert vor
>Sockets, spezifisch TcpClient und TcpListener
>Mögliche Aufgabe: man bekommt iterativer Server und muss nebenläufiger Server erstellen

>[!tip]
>Demoprüfung auf Illias anschauen
>Aufgabe 2 kommt definitiv in dieser Art vor
>Aufgabe 3 ebenfalls


## Grundlagen

### Properties

```cs
public int Size {
	get { return size}
	set { size = value }
}
```

### Indexer

For using index operator on a custom class, e.g. 
```cs
obj = new MyClass()

int yay = obj[2]
```

```cs
public int this[int i] { // set method omitted => read-only
	get { return apples[i-1] + bananas[i-1]; }
}

public int this[string month] { // overloaded read-only indexer
	get {
		switch (month) {
			case "Jan": return apples[0] + bananas[0];
			case "Feb": return apples[1] + bananas[1];
		}
	}
}
```


### Delegates

- In C: Funktionspointer
- Methode registrieren und übergeben?
- can have value `null`
- normal objects on heap
- A delegate variable can hold multiple methods at the same time


Syntax delegate type:
```cs
// 1. Declaration of delegate type
delegate void Notifier (string sender)

// 2. declaration of a delegate variable 
Notifier greetings;

// 3. assigning a method to a delegate variable
void SayHello(string sender){
	Console.WriteLine("Hello from " + sender);
}

greetings = new Notifier(SayHello) // or just greetings = SayHello

// 4. calling a delegate variable
greetings("John");
```

### Events

- Special Delegate Field
- Why events instead of delegates?
	- Only the class that declares the event can fire it (better encapsulation)
	- Other classes may change event fields only with `+=` or `-=` (but not with '=')

```cs
class Model {
	public event Notifier notifyViews;
	public void Change() { ... notifyViews("Model"); }
}

class View {
	public View(Model m) { m.notifyViews += Update; }
	void Update(string sender) { Console.WriteLine(sender + " was changed"); }
}

class Test {
	static void Main() {
		Model model = new Model();
		new View(model); new View(model);
		model.Change();
	}
}

```

In .NET library events have following signature:
```cs
delegate void SomeEventHandler (object source, MyEventArgs e);
```

- Result:  `void`
- 1. parameter: sender of event (type `object`)
- 2. parameter: Method parameters

Another example is if you want to use the `OnKeyDown`. You just register your own method on this event like `KeySourceClass.OnKeyDown += MyKeyHandler`.

### Remote debugging

Just with ssh?


## Multithreading

```cs
using System.Threading
```

Ein Thread darf andere Threads nicht blockieren, ausser er ist in einem kritischen Bereich

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


### Erzeugen, starten, beenden und stoppen

Starten: mit `Start()`


Beendet ist wenn: 
- Die Thread-Methode wird ohne Fehler beendet.
- In der Thread-Methode tritt eine Ausnahme (Exception) auf, welche die Methode beendet.
- Der Thread wird von aussen abgebrochen.

Abort kann requested werden.

>[!warning] remember
>Jeder Thread, bzw. dessen Methode, ist für das Exception Handling selber verantwortlich


### Synchronisation, lock-construct, Blockierung

- Synchronisation: Threads teilen sich ressourcen
- lock-Konstrukt kann kann nur Codeblöcke schützen keine ganzen Methoden.
- Geht auch mit Monitor Klasse. In Monitor können Threads auch pausiert und mit Pulse wieder reaktiviert werden.

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


### Synchronisierungsereignisse

>[!note]
>WaitHandle, Mutex, Semaphore und Monitor mit Wait und Pulse

- Semaphore können von anderen Aktivitätsträgern wieder freigegeben werden 
- Der Thread, welcher Mutex besitzt muss diesen auch freigeben.

**Semaphores:**
```cs
class SemaphoreDemo {
	private static readonly Semaphore sema = new Semaphore(3, 3);
	
	static void Main() {
		for (int i = 0; i < 5; i++) {
			new Thread(Go).Start(i);
		}
	}
	static void Go(object number) {
		for (int i = 0; i < 5; i++) {
			Console.WriteLine("{0}. Thread waits.", number);
			sema.WaitOne();
			Console.WriteLine("{0}. Thread is in critical section", number);
			Thread.Sleep(1000); // Only 3 threads can get here at once
			sema.Release();
			Console.WriteLine("{0}. Thread leaves.", number);
		}
	}
}
```


**Mutex:**
```cs
class MutexDemo {
	// Use a name unique to the application (eg include your company URL)
	private static readonly Mutex mutex =
		new Mutex(false, @"Global\OneAtATimeDemo");
		
	static void Main() {
		// Wait 5 seconds if contended – in case another instance
		// of the program is in the process of shutting down.
		if (!mutex.WaitOne(TimeSpan.FromSeconds(5), false)) {
			Console.WriteLine("Another instance of the app is running.");
			return;
		}
		
		try {
			Console.WriteLine("Running - press Enter to exit");
			Console.ReadLine();
		}
		finally {
			mutex.ReleaseMutex();
		}
	}
}
```



## Data streams


### Ein- Ausgabestreams

Drei Grundlegende Operationen:
- Daten in Stream schreiben
- Daten von Stream lesen
- Nicht unbedingt von Anfang bis Ende lesen -> wahlfreier Zugriff

- **Base Stream:** Direkt in Strom schreiben oder lesen
- **Pass-Through-Streams:** Base-Stream Ergänzung. Puffern, verschlüsseln ...

### Verknüpfung von Ausgabestreams mit Quellen und Senken

Ke Ahnig was hie häre söu. 
Kann string (StreamReader, -Writer, StringReader...) oder binär (BinaryReader) sein


## Sockets

Sockets

```c#
using System.IO
```


**Drei Operationen:**
- In Stream schreiben
	- Welche Art, bestimmt der Typ des Streams
	- Es werden Bytes geschrieben
- Aus Stream lesen
	- Es werden Bytes gelesen
- Wahlfreier Zugriff auf Dateninformationen in einen Stream
	- Ganzer Stream auszuwerten ist nicht immer nötig


Types
- Base-Streams - direkt aus Strom Daten lesen oder schreiben
- Pass-Through-Streams - ergänzen Base-Stream um spezielle Funktionalitäten


>[!tip]
>Handle streams inside a `using` statement like this:
>```csharp
>using (StreamWriter sw = new StreamWriter("data.txt"), System.Text.Encoding.UTF8){
>	sw.WriteLine("Hello there");
>}
>```
>Then the memory gets properly free'd

>[!note]
>`System.Text.Encoding.UTF8` ensures proper encoding


### Socket Prinzip

- Ist Ende-zu-Ende Kommunikation
- Stellen Abstraktion eines Datenendpunktes dar


**Funktionalitäten:**
- Verbindung zu Prozess aufbauen
- Daten senden
- Daten empfangen
- Verbindung beenden
- Einen Port / Applikation binden
- An einem Port auf Verbindungswunsch hören
- Verbindungswunsch akzeptieren / ablehnen


>[!note]
>Wir bewegen uns nur auf dem logischen Pfad (Applikation zu Applikation)
>Physischer Pfad beinhaltet noch die anderen Layers


Erzeugen:
```csharp
TcpClient the Client;
try {
	theClient = new TcpClient(String host, int port);
}
catch (ArgumentOutOfRangeException) {
	// Port ausserhalb des erlaubten Bereichs
}
catch (SocketException) {
	// Fehler beim Zugriff auf Socket
    Console.WriteLine("No: {0}", somevar);
}
```


Informationen:

```csharp
try {
	var theClient = new TcpClient("localhost", 2);
	Socket s = theClient.Client;
	s.LocalEndpoint;
	s.RemoteEndpoint;
	s.ProtocolType;
}
catch (Exception e){
	Console.WriteLine("sucks");
}
```


Server socket (Deprecated):
```csharp
try {
	TcpListener listen = new TcpListener(port);
	listen.Start();

	while(...){
		var client = listen.AcceptTcpClient();// wait for client to connect
		// Kommunikation mit client
		client.Close();
	}
}
catch (Exception e){
	Console.WriteLine("You suck");
}
```

>[!warning]
>Above code is deprecated see recommended below


Server Socket (Recommended):
```csharp
try {
	IPAddress ip = Dns.GetHostEntry("raspberrypi").AddressList[0];
	TcpListener listen = new TcpListener(ip, 420);
	listen.Start();
	while (true){
		TcpClient client = listen.AcceptTcpclient();
		Console.WriteLine("Verbindung zu {0} aufgebaut", client.Client.RemoteEndPoint);
		TextWriter tw = new StreamWriter(client.GetStream());
		tw.Write(DateTime.Now.ToString());
		tw.Flush();
		client.Close();
	}
}
```



### Einsatz und Eigenschaften

`TcpClient()`


### Server Socket

`TcpListener()`


### Iterativ vs nebenläufiger Server

![[nebenlaeufiger_server.png]]
### http-server





## Einführung SW2

Struct vs Objects:
Struct wird auf dem Stack abgelegt, heisst falls ein Struct einer Funktion übergeben wird, wird eine Kopie gemacht und nicht eine Referenz übergeben.

Value types (int, struct, object) are compatible with boxing/unboxing

### Boxing

object obj = 3;
wraps up the value 3 in a heap object.


### Unboxing

int x = (int) obj;

unwraps the value again


### Structs

Fields **must not** be initialized in their declaration

```cs
struct Point {
	int x = 0; // compilation error
}
```

can be allocated with
```cs
Point p; // fields are initialized to '0' (if p is a field of a class!)
Point q = new Point();
```


### Methods

Methods can only be overridden if marked by `virtual`.

Parameters:
- standard/nothing (copy)
- ref (reference)
- out (no value is passed, write in callee needed)
