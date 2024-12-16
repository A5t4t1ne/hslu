# Volatility3 output

windows.info:
```
Volatility 3 Framework 2.8.0
Progress:  100.00		PDB scanning finished                                                                                             
Variable	Value

Kernel Base	0xf80002a48000
DTB	0x187000
Symbols	file:///home/dave/.local/lib/python3.10/site-packages/volatility3/symbols/windows/ntkrnlmp.pdb/ECE191A20CFF4465AE46DF96C2263845-1.json.xz
Is64Bit	True
IsPAE	False
layer_name	0 WindowsIntel32e
memory_layer	1 FileLayer
KdDebuggerDataBlock	0xf80002c2a120
NTBuildLab	7601.24384.amd64fre.win7sp1_ldr_
CSDVersion	1
KdVersionBlock	0xf80002c2a0e8
Major/Minor	15.7601
MachineType	34404
KeNumberProcessors	2
SystemTime	2020-04-20 23:23:26+00:00
NtSystemRoot	C:\Windows
NtProductType	NtProductWinNt
NtMajorVersion	6
NtMinorVersion	1
PE MajorOperatingSystemVersion	6
PE MinorOperatingSystemVersion	1
PE Machine	34404
PE TimeDateStamp	Thu Feb 21 03:36:29 2019
```

windows.psscan
```
Progress:  100.00		PDB scanning finished                        
PID	PPID	ImageFileName	Offset(V)	Threads	Handles	SessionId	Wow64	CreateTime	ExitTime	File output

187032	438093545582	t	0x3752eec0	3342435	-	-	True	2019-05-01 15:31:52.000000 UTC	N/A	Disabled
107152475972980	121450659013441	ocessToken	0x783dfa06	22373	-	-	True	2011-04-21 23:11:29.000000 UTC	-	Disabled
27487859972864	8813293930680	A       0xb0a10efe	898697220	-	-	True	2033-08-19 17:17:27.000000 UTC	-	Disabled
4196	3384	chrome.exe	0x13d406b00	8	106	1	False	2020-04-20 23:17:15.000000 UTC	N/A	Disabled
2216	472	dllhost.exe	0x13d4145f0	13	195	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
2324	472	msdtc.exe	0x13d46db00	12	148	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
2848	2208	slack.exe	0x13d4cdb00	14	276	1	False	2020-04-20 23:17:00.000000 UTC	N/A	Disabled
2032	472	svchost.exe	0x13d62c060	6	105	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
1576	472	vmtoolsd.exe	0x13d64a060	10	289	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
2944	472	svchost.exe	0x13d65b060	9	136	0	False	2020-04-20 22:46:40.000000 UTC	N/A	Disabled
1952	472	sppsvc.exe	0x13d735060	4	170	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
1080	472	svchost.exe	0x13d76e060	7	101	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
2108	660	WmiPrvSE.exe	0x13d79eb00	12	221	0	False	2020-04-20 22:44:40.000000 UTC	N/A	Disabled
4236	3384	chrome.exe	0x13d7d8b00	13	245	1	False	2020-04-20 23:17:15.000000 UTC	N/A	Disabled
1160	472	svchost.exe	0x13d824860	21	668	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
1304	472	spoolsv.exe	0x13d83eb00	13	287	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
4056	2580	SearchProtocol	0x13d874b00	7	317	0	False	2020-04-20 23:23:19.000000 UTC	N/A	Disabled
1332	472	svchost.exe	0x13d8d8b00	19	346	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
1444	472	svchost.exe	0x13d97c5f0	10	146	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
1520	472	VGAuthService.	0x13d9e7720	3	86	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
1636	472	wlms.exe	0x13d9edb00	4	46	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
660	472	svchost.exe	0x13da27b00	11	378	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
3596	3384	chrome.exe	0x13da34a80	9	211	1	False	2020-04-20 23:17:09.000000 UTC	N/A	Disabled
728	472	vmacthlp.exe	0x13da5c060	3	66	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
772	472	svchost.exe	0x13da66060	10	336	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
860	472	svchost.exe	0x13dab0b00	21	514	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
936	472	svchost.exe	0x13dafa5f0	20	460	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
980	472	svchost.exe	0x13db379b0	15	655	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
112	472	svchost.exe	0x13db3db00	44	1260	0	False	2020-04-20 22:44:39.000000 UTC	N/A	Disabled
3440	660	WmiPrvSE.exe	0x13dbd6060	13	332	0	False	2020-04-20 23:17:13.000000 UTC	N/A	Disabled
472	408	services.exe	0x13dd7e8e0	7	241	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
508	416	winlogon.exe	0x13dd97060	5	117	1	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
536	408	lsass.exe	0x13dda7b00	7	648	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
544	408	lsm.exe	0x13ddadb00	10	211	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
364	352	csrss.exe	0x13df05b00	9	532	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
2984	2672	iexplore.exe	0x13e066060	14	514	1	False	2020-04-20 23:18:35.000000 UTC	N/A	Disabled
440	416	csrss.exe	0x13e229350	11	534	1	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
1092	472	WmiApSrv.exe	0x13e6c94e0	4	106	0	False	2020-04-20 23:19:22.000000 UTC	N/A	Disabled
3748	3384	chrome.exe	0x13e71bb00	12	155	1	False	2020-04-20 23:17:10.000000 UTC	N/A	Disabled
3756	3384	chrome.exe	0x13e71db00	12	166	1	False	2020-04-20 23:17:10.000000 UTC	N/A	Disabled
4600	3384	chrome.exe	0x13e7dcb00	13	225	1	False	2020-04-20 23:17:32.000000 UTC	N/A	Disabled
3392	3384	chrome.exe	0x13e829060	7	95	1	False	2020-04-20 23:17:07.000000 UTC	N/A	Disabled
3492	3384	chrome.exe	0x13e8ca5c0	2	56	1	False	2020-04-20 23:17:09.000000 UTC	N/A	Disabled
1728	860	audiodg.exe	0x13e8e1940	5	136	0	False	2020-04-20 23:16:54.000000 UTC	N/A	Disabled
408	352	wininit.exe	0x13e94d580	3	76	0	False	2020-04-20 22:44:38.000000 UTC	N/A	Disabled
3464	112	wuauclt.exe	0x13e98cb00	3	94	1	False	2020-04-20 23:17:08.000000 UTC	N/A	Disabled
3604	3384	chrome.exe	0x13e99db00	15	329	1	False	2020-04-20 23:17:09.000000 UTC	N/A	Disabled
280	4	smss.exe	0x13ec05aa0	2	30	N/A	False	2020-04-20 22:44:37.000000 UTC	N/A	Disabled
4484	3384	chrome.exe	0x13ed50b00	16	184	1	False	2020-04-20 23:24:22.000000 UTC	N/A	Disabled
1996	2580	SearchFilterHo	0x13edb8690	6	88	0	False	2020-04-20 23:23:19.000000 UTC	N/A	Disabled
3384	2672	chrome.exe	0x13ee2c2c0	30	1039	1	False	2020-04-20 23:17:07.000000 UTC	N/A	Disabled
2928	2672	vmtoolsd.exe	0x13ee80b00	9	178	1	False	2020-04-20 23:16:54.000000 UTC	N/A	Disabled
2852	936	dwm.exe	0x13eea9940	3	82	1	False	2020-04-20 23:16:53.000000 UTC	N/A	Disabled
2728	2208	slack.exe	0x13eed3710	9	213	1	False	2020-04-20 23:16:59.000000 UTC	N/A	Disabled
4480	2984	iexplore.exe	0x13f134a40	18	566	1	True	2020-04-20 23:18:35.000000 UTC	N/A	Disabled
4332	2672	FTK Imager.exe	0x13f2c2b00	12	421	1	True	2020-04-20 23:19:17.000000 UTC	N/A	Disabled
2188	3384	chrome.exe	0x13f2f5060	14	480	1	False	2020-04-20 23:24:22.000000 UTC	N/A	Disabled
2208	2412	slack.exe	0x13f65eb00	28	553	1	False	2020-04-20 23:16:54.000000 UTC	N/A	Disabled
2812	2208	slack.exe	0x13f688b00	15	325	1	False	2020-04-20 23:17:00.000000 UTC	N/A	Disabled
1396	472	taskhost.exe	0x13f6f9060	10	223	1	False	2020-04-20 23:16:53.000000 UTC	N/A	Disabled
3180	2672	WINWORD.EXE	0x13f77bb00	15	698	1	False	2020-04-20 23:17:06.000000 UTC	N/A	Disabled
2672	2148	explorer.exe	0x13f7ff060	31	1018	1	False	2020-04-20 23:16:53.000000 UTC	N/A	Disabled
2164	2508	WerFault.exe	0x13f80c5f0	5	133	1	False	2020-04-20 23:16:54.000000 UTC	N/A	Disabled
1172	2208	slack.exe	0x13f871b00	7	135	1	False	2020-04-20 23:17:00.000000 UTC	N/A	Disabled
2580	472	SearchIndexer.	0x13fc90060	13	694	0	False	2020-04-20 22:46:41.000000 UTC	N/A	Disabled
4404	3384	chrome.exe	0x13fcb1780	13	218	1	False	2020-04-20 23:17:19.000000 UTC	N/A	Disabled
360	472	svchost.exe	0x13fcb3b00	13	361	0	False	2020-04-20 22:46:40.000000 UTC	N/A	Disabled
4	0	System	0x13fe57b00	108	572	N/A	False	2020-04-20 22:44:37.000000 UTC	N/A	Disabled
```

