
./mul3:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000318 <.interp>:
 318:	2f                   	(bad)
 319:	6c                   	insb   (%dx),%es:(%rdi)
 31a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
 321:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
 326:	78 2d                	js     355 <_init-0xcab>
 328:	78 38                	js     362 <_init-0xc9e>
 32a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
 330:	6f                   	outsl  %ds:(%rsi),(%dx)
 331:	2e 32 00             	cs xor (%rax),%al

Disassembly of section .note.gnu.property:

0000000000000338 <.note.gnu.property>:
 338:	04 00                	add    $0x0,%al
 33a:	00 00                	add    %al,(%rax)
 33c:	30 00                	xor    %al,(%rax)
 33e:	00 00                	add    %al,(%rax)
 340:	05 00 00 00 47       	add    $0x47000000,%eax
 345:	4e 55                	rex.WRX push %rbp
 347:	00 02                	add    %al,(%rdx)
 349:	80 00 c0             	addb   $0xc0,(%rax)
 34c:	04 00                	add    $0x0,%al
 34e:	00 00                	add    %al,(%rax)
 350:	01 00                	add    %eax,(%rax)
 352:	00 00                	add    %al,(%rax)
 354:	00 00                	add    %al,(%rax)
 356:	00 00                	add    %al,(%rax)
 358:	01 00                	add    %eax,(%rax)
 35a:	01 c0                	add    %eax,%eax
 35c:	04 00                	add    $0x0,%al
 35e:	00 00                	add    %al,(%rax)
 360:	01 00                	add    %eax,(%rax)
 362:	00 00                	add    %al,(%rax)
 364:	00 00                	add    %al,(%rax)
 366:	00 00                	add    %al,(%rax)
 368:	02 00                	add    (%rax),%al
 36a:	01 c0                	add    %eax,%eax
 36c:	04 00                	add    $0x0,%al
	...

Disassembly of section .note.gnu.build-id:

0000000000000378 <.note.gnu.build-id>:
 378:	04 00                	add    $0x0,%al
 37a:	00 00                	add    %al,(%rax)
 37c:	14 00                	adc    $0x0,%al
 37e:	00 00                	add    %al,(%rax)
 380:	03 00                	add    (%rax),%eax
 382:	00 00                	add    %al,(%rax)
 384:	47                   	rex.RXB
 385:	4e 55                	rex.WRX push %rbp
 387:	00 02                	add    %al,(%rdx)
 389:	70 7f                	jo     40a <_init-0xbf6>
 38b:	29 49 75             	sub    %ecx,0x75(%rcx)
 38e:	6c                   	insb   (%dx),%es:(%rdi)
 38f:	72 b4                	jb     345 <_init-0xcbb>
 391:	c6                   	(bad)
 392:	72 e1                	jb     375 <_init-0xc8b>
 394:	2e 2b 05 e0 84 16 85 	cs sub -0x7ae97b20(%rip),%eax        # ffffffff8516887b <_end+0xffffffff8516484b>
 39b:	06                   	(bad)

Disassembly of section .note.ABI-tag:

000000000000039c <.note.ABI-tag>:
 39c:	04 00                	add    $0x0,%al
 39e:	00 00                	add    %al,(%rax)
 3a0:	10 00                	adc    %al,(%rax)
 3a2:	00 00                	add    %al,(%rax)
 3a4:	01 00                	add    %eax,(%rax)
 3a6:	00 00                	add    %al,(%rax)
 3a8:	47                   	rex.RXB
 3a9:	4e 55                	rex.WRX push %rbp
 3ab:	00 00                	add    %al,(%rax)
 3ad:	00 00                	add    %al,(%rax)
 3af:	00 04 00             	add    %al,(%rax,%rax,1)
 3b2:	00 00                	add    %al,(%rax)
 3b4:	04 00                	add    $0x0,%al
 3b6:	00 00                	add    %al,(%rax)
 3b8:	00 00                	add    %al,(%rax)
	...

Disassembly of section .gnu.hash:

00000000000003c0 <.gnu.hash>:
 3c0:	01 00                	add    %eax,(%rax)
 3c2:	00 00                	add    %al,(%rax)
 3c4:	01 00                	add    %eax,(%rax)
 3c6:	00 00                	add    %al,(%rax)
 3c8:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .dynsym:

00000000000003e0 <.dynsym>:
	...
 3f8:	08 00                	or     %al,(%rax)
 3fa:	00 00                	add    %al,(%rax)
 3fc:	12 00                	adc    (%rax),%al
	...
 40e:	00 00                	add    %al,(%rax)
 410:	6a 00                	push   $0x0
 412:	00 00                	add    %al,(%rax)
 414:	20 00                	and    %al,(%rax)
	...
 426:	00 00                	add    %al,(%rax)
 428:	01 00                	add    %eax,(%rax)
 42a:	00 00                	add    %al,(%rax)
 42c:	12 00                	adc    (%rax),%al
	...
 43e:	00 00                	add    %al,(%rax)
 440:	29 00                	sub    %eax,(%rax)
 442:	00 00                	add    %al,(%rax)
 444:	12 00                	adc    (%rax),%al
	...
 456:	00 00                	add    %al,(%rax)
 458:	86 00                	xchg   %al,(%rax)
 45a:	00 00                	add    %al,(%rax)
 45c:	20 00                	and    %al,(%rax)
	...
 46e:	00 00                	add    %al,(%rax)
 470:	30 00                	xor    %al,(%rax)
 472:	00 00                	add    %al,(%rax)
 474:	12 00                	adc    (%rax),%al
	...
 486:	00 00                	add    %al,(%rax)
 488:	95                   	xchg   %eax,%ebp
 489:	00 00                	add    %al,(%rax)
 48b:	00 20                	add    %ah,(%rax)
	...
 49d:	00 00                	add    %al,(%rax)
 49f:	00 1a                	add    %bl,(%rdx)
 4a1:	00 00                	add    %al,(%rax)
 4a3:	00 22                	add    %ah,(%rdx)
	...

Disassembly of section .dynstr:

00000000000004b8 <.dynstr>:
 4b8:	00 73 74             	add    %dh,0x74(%rbx)
 4bb:	72 6c                	jb     529 <_init-0xad7>
 4bd:	65 6e                	outsb  %gs:(%rsi),(%dx)
 4bf:	00 5f 5f             	add    %bl,0x5f(%rdi)
 4c2:	6c                   	insb   (%dx),%es:(%rdi)
 4c3:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
 4ca:	72 74                	jb     540 <_init-0xac0>
 4cc:	5f                   	pop    %rdi
 4cd:	6d                   	insl   (%dx),%es:(%rdi)
 4ce:	61                   	(bad)
 4cf:	69 6e 00 5f 5f 63 78 	imul   $0x78635f5f,0x0(%rsi),%ebp
 4d6:	61                   	(bad)
 4d7:	5f                   	pop    %rdi
 4d8:	66 69 6e 61 6c 69    	imul   $0x696c,0x61(%rsi),%bp
 4de:	7a 65                	jp     545 <_init-0xabb>
 4e0:	00 70 72             	add    %dh,0x72(%rax)
 4e3:	69 6e 74 66 00 5f 5f 	imul   $0x5f5f0066,0x74(%rsi),%ebp
 4ea:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
 4f1:	73 63                	jae    556 <_init-0xaaa>
 4f3:	61                   	(bad)
 4f4:	6e                   	outsb  %ds:(%rsi),(%dx)
 4f5:	66 00 6c 69 62       	data16 add %ch,0x62(%rcx,%rbp,2)
 4fa:	63 2e                	movsxd (%rsi),%ebp
 4fc:	73 6f                	jae    56d <_init-0xa93>
 4fe:	2e 36 00 47 4c       	cs ss add %al,0x4c(%rdi)
 503:	49                   	rex.WB
 504:	42                   	rex.X
 505:	43 5f                	rex.XB pop %r15
 507:	32 2e                	xor    (%rsi),%ch
 509:	37                   	(bad)
 50a:	00 47 4c             	add    %al,0x4c(%rdi)
 50d:	49                   	rex.WB
 50e:	42                   	rex.X
 50f:	43 5f                	rex.XB pop %r15
 511:	32 2e                	xor    (%rsi),%ch
 513:	32 2e                	xor    (%rsi),%ch
 515:	35 00 47 4c 49       	xor    $0x494c4700,%eax
 51a:	42                   	rex.X
 51b:	43 5f                	rex.XB pop %r15
 51d:	32 2e                	xor    (%rsi),%ch
 51f:	33 34 00             	xor    (%rax,%rax,1),%esi
 522:	5f                   	pop    %rdi
 523:	49 54                	rex.WB push %r12
 525:	4d 5f                	rex.WRB pop %r15
 527:	64 65 72 65          	fs gs jb 590 <_init-0xa70>
 52b:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 532:	4d 
 533:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 535:	6f                   	outsl  %ds:(%rsi),(%dx)
 536:	6e                   	outsb  %ds:(%rsi),(%dx)
 537:	65 54                	gs push %rsp
 539:	61                   	(bad)
 53a:	62 6c 65 00 5f       	(bad)
 53f:	5f                   	pop    %rdi
 540:	67 6d                	insl   (%dx),%es:(%edi)
 542:	6f                   	outsl  %ds:(%rsi),(%dx)
 543:	6e                   	outsb  %ds:(%rsi),(%dx)
 544:	5f                   	pop    %rdi
 545:	73 74                	jae    5bb <_init-0xa45>
 547:	61                   	(bad)
 548:	72 74                	jb     5be <_init-0xa42>
 54a:	5f                   	pop    %rdi
 54b:	5f                   	pop    %rdi
 54c:	00 5f 49             	add    %bl,0x49(%rdi)
 54f:	54                   	push   %rsp
 550:	4d 5f                	rex.WRB pop %r15
 552:	72 65                	jb     5b9 <_init-0xa47>
 554:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 55b:	4d 
 55c:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 55e:	6f                   	outsl  %ds:(%rsi),(%dx)
 55f:	6e                   	outsb  %ds:(%rsi),(%dx)
 560:	65 54                	gs push %rsp
 562:	61                   	(bad)
 563:	62                   	.byte 0x62
 564:	6c                   	insb   (%dx),%es:(%rdi)
 565:	65                   	gs
	...

Disassembly of section .gnu.version:

0000000000000568 <.gnu.version>:
 568:	00 00                	add    %al,(%rax)
 56a:	02 00                	add    (%rax),%al
 56c:	01 00                	add    %eax,(%rax)
 56e:	03 00                	add    (%rax),%eax
 570:	03 00                	add    (%rax),%eax
 572:	01 00                	add    %eax,(%rax)
 574:	04 00                	add    $0x0,%al
 576:	01 00                	add    %eax,(%rax)
 578:	03 00                	add    (%rax),%eax

Disassembly of section .gnu.version_r:

0000000000000580 <.gnu.version_r>:
 580:	01 00                	add    %eax,(%rax)
 582:	03 00                	add    (%rax),%eax
 584:	3f                   	(bad)
 585:	00 00                	add    %al,(%rax)
 587:	00 10                	add    %dl,(%rax)
 589:	00 00                	add    %al,(%rax)
 58b:	00 00                	add    %al,(%rax)
 58d:	00 00                	add    %al,(%rax)
 58f:	00 17                	add    %dl,(%rdi)
 591:	69 69 0d 00 00 04 00 	imul   $0x40000,0xd(%rcx),%ebp
 598:	49 00 00             	rex.WB add %al,(%r8)
 59b:	00 10                	add    %dl,(%rax)
 59d:	00 00                	add    %al,(%rax)
 59f:	00 75 1a             	add    %dh,0x1a(%rbp)
 5a2:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
 5a8:	53                   	push   %rbx
 5a9:	00 00                	add    %al,(%rax)
 5ab:	00 10                	add    %dl,(%rax)
 5ad:	00 00                	add    %al,(%rax)
 5af:	00 b4 91 96 06 00 00 	add    %dh,0x696(%rcx,%rdx,4)
 5b6:	02 00                	add    (%rax),%al
 5b8:	5f                   	pop    %rdi
 5b9:	00 00                	add    %al,(%rax)
 5bb:	00 00                	add    %al,(%rax)
 5bd:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

00000000000005c0 <.rela.dyn>:
 5c0:	d0 3d 00 00 00 00    	sarb   $1,0x0(%rip)        # 5c6 <_init-0xa3a>
 5c6:	00 00                	add    %al,(%rax)
 5c8:	08 00                	or     %al,(%rax)
 5ca:	00 00                	add    %al,(%rax)
 5cc:	00 00                	add    %al,(%rax)
 5ce:	00 00                	add    %al,(%rax)
 5d0:	50                   	push   %rax
 5d1:	11 00                	adc    %eax,(%rax)
 5d3:	00 00                	add    %al,(%rax)
 5d5:	00 00                	add    %al,(%rax)
 5d7:	00 d8                	add    %bl,%al
 5d9:	3d 00 00 00 00       	cmp    $0x0,%eax
 5de:	00 00                	add    %al,(%rax)
 5e0:	08 00                	or     %al,(%rax)
 5e2:	00 00                	add    %al,(%rax)
 5e4:	00 00                	add    %al,(%rax)
 5e6:	00 00                	add    %al,(%rax)
 5e8:	00 11                	add    %dl,(%rcx)
 5ea:	00 00                	add    %al,(%rax)
 5ec:	00 00                	add    %al,(%rax)
 5ee:	00 00                	add    %al,(%rax)
 5f0:	20 40 00             	and    %al,0x0(%rax)
 5f3:	00 00                	add    %al,(%rax)
 5f5:	00 00                	add    %al,(%rax)
 5f7:	00 08                	add    %cl,(%rax)
 5f9:	00 00                	add    %al,(%rax)
 5fb:	00 00                	add    %al,(%rax)
 5fd:	00 00                	add    %al,(%rax)
 5ff:	00 20                	add    %ah,(%rax)
 601:	40 00 00             	rex add %al,(%rax)
 604:	00 00                	add    %al,(%rax)
 606:	00 00                	add    %al,(%rax)
 608:	c0 3f 00             	sarb   $0x0,(%rdi)
 60b:	00 00                	add    %al,(%rax)
 60d:	00 00                	add    %al,(%rax)
 60f:	00 06                	add    %al,(%rsi)
 611:	00 00                	add    %al,(%rax)
 613:	00 01                	add    %al,(%rcx)
	...
 61d:	00 00                	add    %al,(%rax)
 61f:	00 c8                	add    %cl,%al
 621:	3f                   	(bad)
 622:	00 00                	add    %al,(%rax)
 624:	00 00                	add    %al,(%rax)
 626:	00 00                	add    %al,(%rax)
 628:	06                   	(bad)
 629:	00 00                	add    %al,(%rax)
 62b:	00 02                	add    %al,(%rdx)
	...
 635:	00 00                	add    %al,(%rax)
 637:	00 d0                	add    %dl,%al
 639:	3f                   	(bad)
 63a:	00 00                	add    %al,(%rax)
 63c:	00 00                	add    %al,(%rax)
 63e:	00 00                	add    %al,(%rax)
 640:	06                   	(bad)
 641:	00 00                	add    %al,(%rax)
 643:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 649 <_init-0x9b7>
 649:	00 00                	add    %al,(%rax)
 64b:	00 00                	add    %al,(%rax)
 64d:	00 00                	add    %al,(%rax)
 64f:	00 d8                	add    %bl,%al
 651:	3f                   	(bad)
 652:	00 00                	add    %al,(%rax)
 654:	00 00                	add    %al,(%rax)
 656:	00 00                	add    %al,(%rax)
 658:	06                   	(bad)
 659:	00 00                	add    %al,(%rax)
 65b:	00 07                	add    %al,(%rdi)
	...
 665:	00 00                	add    %al,(%rax)
 667:	00 e0                	add    %ah,%al
 669:	3f                   	(bad)
 66a:	00 00                	add    %al,(%rax)
 66c:	00 00                	add    %al,(%rax)
 66e:	00 00                	add    %al,(%rax)
 670:	06                   	(bad)
 671:	00 00                	add    %al,(%rax)
 673:	00 08                	add    %cl,(%rax)
	...

Disassembly of section .rela.plt:

0000000000000680 <.rela.plt>:
 680:	00 40 00             	add    %al,0x0(%rax)
 683:	00 00                	add    %al,(%rax)
 685:	00 00                	add    %al,(%rax)
 687:	00 07                	add    %al,(%rdi)
 689:	00 00                	add    %al,(%rax)
 68b:	00 03                	add    %al,(%rbx)
	...
 695:	00 00                	add    %al,(%rax)
 697:	00 08                	add    %cl,(%rax)
 699:	40 00 00             	rex add %al,(%rax)
 69c:	00 00                	add    %al,(%rax)
 69e:	00 00                	add    %al,(%rax)
 6a0:	07                   	(bad)
 6a1:	00 00                	add    %al,(%rax)
 6a3:	00 04 00             	add    %al,(%rax,%rax,1)
	...
 6ae:	00 00                	add    %al,(%rax)
 6b0:	10 40 00             	adc    %al,0x0(%rax)
 6b3:	00 00                	add    %al,(%rax)
 6b5:	00 00                	add    %al,(%rax)
 6b7:	00 07                	add    %al,(%rdi)
 6b9:	00 00                	add    %al,(%rax)
 6bb:	00 06                	add    %al,(%rsi)
	...

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <strlen@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <strlen@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <strlen@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <printf@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <printf@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <__isoc99_scanf@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <__isoc99_scanf@GLIBC_2.7>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	f3 0f 1e fa          	endbr64
    1064:	31 ed                	xor    %ebp,%ebp
    1066:	49 89 d1             	mov    %rdx,%r9
    1069:	5e                   	pop    %rsi
    106a:	48 89 e2             	mov    %rsp,%rdx
    106d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1071:	50                   	push   %rax
    1072:	54                   	push   %rsp
    1073:	45 31 c0             	xor    %r8d,%r8d
    1076:	31 c9                	xor    %ecx,%ecx
    1078:	48 8d 3d da 00 00 00 	lea    0xda(%rip),%rdi        # 1159 <main>
    107f:	ff 15 3b 2f 00 00    	call   *0x2f3b(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1085:	f4                   	hlt
    1086:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    108d:	00 00 00 
    1090:	48 8d 3d 91 2f 00 00 	lea    0x2f91(%rip),%rdi        # 4028 <__TMC_END__>
    1097:	48 8d 05 8a 2f 00 00 	lea    0x2f8a(%rip),%rax        # 4028 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <_start+0x58>
    10a3:	48 8b 05 1e 2f 00 00 	mov    0x2f1e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <_start+0x58>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c0:	48 8d 3d 61 2f 00 00 	lea    0x2f61(%rip),%rdi        # 4028 <__TMC_END__>
    10c7:	48 8d 35 5a 2f 00 00 	lea    0x2f5a(%rip),%rsi        # 4028 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    $1,%rsi
    10e2:	74 14                	je     10f8 <_start+0x98>
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <_start+0x98>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 1d 2f 00 00 00 	cmpb   $0x0,0x2f1d(%rip)        # 4028 <__TMC_END__>
    110b:	75 33                	jne    1140 <_start+0xe0>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1115:	00 
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0d                	je     1128 <_start+0xc8>
    111b:	48 8b 3d fe 2e 00 00 	mov    0x2efe(%rip),%rdi        # 4020 <__dso_handle>
    1122:	ff 15 b8 2e 00 00    	call   *0x2eb8(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1128:	e8 63 ff ff ff       	call   1090 <_start+0x30>
    112d:	c6 05 f4 2e 00 00 01 	movb   $0x1,0x2ef4(%rip)        # 4028 <__TMC_END__>
    1134:	5d                   	pop    %rbp
    1135:	c3                   	ret
    1136:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    113d:	00 00 00 
    1140:	c3                   	ret
    1141:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1148:	00 00 00 00 
    114c:	0f 1f 40 00          	nopl   0x0(%rax)
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 67 ff ff ff       	jmp    10c0 <_start+0x60>

0000000000001159 <main>:
    1159:	55                   	push   %rbp
    115a:	48 89 e5             	mov    %rsp,%rbp
    115d:	48 83 ec 30          	sub    $0x30,%rsp
    1161:	89 7d dc             	mov    %edi,-0x24(%rbp)
    1164:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    1168:	48 8d 05 95 0e 00 00 	lea    0xe95(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    116f:	48 89 c7             	mov    %rax,%rdi
    1172:	b8 00 00 00 00       	mov    $0x0,%eax
    1177:	e8 c4 fe ff ff       	call   1040 <printf@plt>
    117c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1180:	48 89 c6             	mov    %rax,%rsi
    1183:	48 8d 05 8b 0e 00 00 	lea    0xe8b(%rip),%rax        # 2015 <_IO_stdin_used+0x15>
    118a:	48 89 c7             	mov    %rax,%rdi
    118d:	b8 00 00 00 00       	mov    $0x0,%eax
    1192:	e8 b9 fe ff ff       	call   1050 <__isoc99_scanf@plt>
    1197:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    119b:	48 89 c7             	mov    %rax,%rdi
    119e:	e8 8d fe ff ff       	call   1030 <strlen@plt>
    11a3:	89 45 f0             	mov    %eax,-0x10(%rbp)
    11a6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    11ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    11b4:	e9 8d 00 00 00       	jmp    1246 <main+0xed>
    11b9:	8b 45 f0             	mov    -0x10(%rbp),%eax
    11bc:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    11bf:	48 98                	cltq
    11c1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    11c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11c9:	48 01 d0             	add    %rdx,%rax
    11cc:	0f b6 00             	movzbl (%rax),%eax
    11cf:	0f be c0             	movsbl %al,%eax
    11d2:	83 e8 30             	sub    $0x30,%eax
    11d5:	89 45 f4             	mov    %eax,-0xc(%rbp)
    11d8:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
    11df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    11e6:	eb 13                	jmp    11fb <main+0xa2>
    11e8:	8b 55 e8             	mov    -0x18(%rbp),%edx
    11eb:	89 d0                	mov    %edx,%eax
    11ed:	c1 e0 02             	shl    $0x2,%eax
    11f0:	01 d0                	add    %edx,%eax
    11f2:	01 c0                	add    %eax,%eax
    11f4:	89 45 e8             	mov    %eax,-0x18(%rbp)
    11f7:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    11fb:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11fe:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    1201:	7c e5                	jl     11e8 <main+0x8f>
    1203:	8b 55 e8             	mov    -0x18(%rbp),%edx
    1206:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1209:	89 c6                	mov    %eax,%esi
    120b:	48 8d 05 06 0e 00 00 	lea    0xe06(%rip),%rax        # 2018 <_IO_stdin_used+0x18>
    1212:	48 89 c7             	mov    %rax,%rdi
    1215:	b8 00 00 00 00       	mov    $0x0,%eax
    121a:	e8 21 fe ff ff       	call   1040 <printf@plt>
    121f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1222:	0f af 45 e8          	imul   -0x18(%rbp),%eax
    1226:	01 45 e0             	add    %eax,-0x20(%rbp)
    1229:	8b 45 e0             	mov    -0x20(%rbp),%eax
    122c:	89 c6                	mov    %eax,%esi
    122e:	48 8d 05 fa 0d 00 00 	lea    0xdfa(%rip),%rax        # 202f <_IO_stdin_used+0x2f>
    1235:	48 89 c7             	mov    %rax,%rdi
    1238:	b8 00 00 00 00       	mov    $0x0,%eax
    123d:	e8 fe fd ff ff       	call   1040 <printf@plt>
    1242:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    1246:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1249:	3b 45 f0             	cmp    -0x10(%rbp),%eax
    124c:	0f 8c 67 ff ff ff    	jl     11b9 <main+0x60>
    1252:	b8 00 00 00 00       	mov    $0x0,%eax
    1257:	c9                   	leave
    1258:	c3                   	ret

Disassembly of section .fini:

000000000000125c <_fini>:
    125c:	f3 0f 1e fa          	endbr64
    1260:	48 83 ec 08          	sub    $0x8,%rsp
    1264:	48 83 c4 08          	add    $0x8,%rsp
    1268:	c3                   	ret

Disassembly of section .rodata:

0000000000002000 <_IO_stdin_used>:
    2000:	01 00                	add    %eax,(%rax)
    2002:	02 00                	add    (%rax),%al
    2004:	45 6e                	rex.RB outsb %ds:(%rsi),(%dx)
    2006:	74 65                	je     206d <__GNU_EH_FRAME_HDR+0x31>
    2008:	72 20                	jb     202a <_IO_stdin_used+0x2a>
    200a:	61                   	(bad)
    200b:	20 6e 75             	and    %ch,0x75(%rsi)
    200e:	6d                   	insl   (%dx),%es:(%rdi)
    200f:	62 65 72 3a 20       	(bad)
    2014:	00 25 73 00 64 69    	add    %ah,0x69640073(%rip)        # 6964208d <_end+0x6963e05d>
    201a:	67 69 74 3a 20 25 64 	imul   $0x202c6425,0x20(%edx,%edi,1),%esi
    2021:	2c 20 
    2023:	66 61                	data16 (bad)
    2025:	63 74 6f 72          	movsxd 0x72(%rdi,%rbp,2),%esi
    2029:	3a 20                	cmp    (%rax),%ah
    202b:	25 64 0a 00 6e       	and    $0x6e000a64,%eax
    2030:	75 6d                	jne    209f <__GNU_EH_FRAME_HDR+0x63>
    2032:	3a 20                	cmp    (%rax),%ah
    2034:	25 64 0a 0a 00       	and    $0xa0a64,%eax

Disassembly of section .eh_frame_hdr:

000000000000203c <__GNU_EH_FRAME_HDR>:
    203c:	01 1b                	add    %ebx,(%rbx)
    203e:	03 3b                	add    (%rbx),%edi
    2040:	20 00                	and    %al,(%rax)
    2042:	00 00                	add    %al,(%rax)
    2044:	03 00                	add    (%rax),%eax
    2046:	00 00                	add    %al,(%rax)
    2048:	e4 ef                	in     $0xef,%al
    204a:	ff                   	(bad)
    204b:	ff 54 00 00          	call   *0x0(%rax,%rax,1)
    204f:	00 24 f0             	add    %ah,(%rax,%rsi,8)
    2052:	ff                   	(bad)
    2053:	ff                   	(bad)
    2054:	3c 00                	cmp    $0x0,%al
    2056:	00 00                	add    %al,(%rax)
    2058:	1d f1 ff ff 7c       	sbb    $0x7cfffff1,%eax
    205d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .eh_frame:

0000000000002060 <.eh_frame>:
    2060:	14 00                	adc    $0x0,%al
    2062:	00 00                	add    %al,(%rax)
    2064:	00 00                	add    %al,(%rax)
    2066:	00 00                	add    %al,(%rax)
    2068:	01 7a 52             	add    %edi,0x52(%rdx)
    206b:	00 01                	add    %al,(%rcx)
    206d:	78 10                	js     207f <__GNU_EH_FRAME_HDR+0x43>
    206f:	01 1b                	add    %ebx,(%rbx)
    2071:	0c 07                	or     $0x7,%al
    2073:	08 90 01 00 00 14    	or     %dl,0x14000001(%rax)
    2079:	00 00                	add    %al,(%rax)
    207b:	00 1c 00             	add    %bl,(%rax,%rax,1)
    207e:	00 00                	add    %al,(%rax)
    2080:	e0 ef                	loopne 2071 <__GNU_EH_FRAME_HDR+0x35>
    2082:	ff                   	(bad)
    2083:	ff 26                	jmp    *(%rsi)
    2085:	00 00                	add    %al,(%rax)
    2087:	00 00                	add    %al,(%rax)
    2089:	44 07                	rex.R (bad)
    208b:	10 00                	adc    %al,(%rax)
    208d:	00 00                	add    %al,(%rax)
    208f:	00 24 00             	add    %ah,(%rax,%rax,1)
    2092:	00 00                	add    %al,(%rax)
    2094:	34 00                	xor    $0x0,%al
    2096:	00 00                	add    %al,(%rax)
    2098:	88 ef                	mov    %ch,%bh
    209a:	ff                   	(bad)
    209b:	ff 40 00             	incl   0x0(%rax)
    209e:	00 00                	add    %al,(%rax)
    20a0:	00 0e                	add    %cl,(%rsi)
    20a2:	10 46 0e             	adc    %al,0xe(%rsi)
    20a5:	18 4a 0f             	sbb    %cl,0xf(%rdx)
    20a8:	0b 77 08             	or     0x8(%rdi),%esi
    20ab:	80 00 3f             	addb   $0x3f,(%rax)
    20ae:	1a 3b                	sbb    (%rbx),%bh
    20b0:	2a 33                	sub    (%rbx),%dh
    20b2:	24 22                	and    $0x22,%al
    20b4:	00 00                	add    %al,(%rax)
    20b6:	00 00                	add    %al,(%rax)
    20b8:	1c 00                	sbb    $0x0,%al
    20ba:	00 00                	add    %al,(%rax)
    20bc:	5c                   	pop    %rsp
    20bd:	00 00                	add    %al,(%rax)
    20bf:	00 99 f0 ff ff 00    	add    %bl,0xfffff0(%rcx)
    20c5:	01 00                	add    %eax,(%rax)
    20c7:	00 00                	add    %al,(%rax)
    20c9:	41 0e                	rex.B (bad)
    20cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    20d1:	02 fb                	add    %bl,%bh
    20d3:	0c 07                	or     $0x7,%al
    20d5:	08 00                	or     %al,(%rax)
    20d7:	00 00                	add    %al,(%rax)
    20d9:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000003dd0 <.init_array>:
    3dd0:	50                   	push   %rax
    3dd1:	11 00                	adc    %eax,(%rax)
    3dd3:	00 00                	add    %al,(%rax)
    3dd5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000003dd8 <.fini_array>:
    3dd8:	00 11                	add    %dl,(%rcx)
    3dda:	00 00                	add    %al,(%rax)
    3ddc:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynamic:

0000000000003de0 <_DYNAMIC>:
    3de0:	01 00                	add    %eax,(%rax)
    3de2:	00 00                	add    %al,(%rax)
    3de4:	00 00                	add    %al,(%rax)
    3de6:	00 00                	add    %al,(%rax)
    3de8:	3f                   	(bad)
    3de9:	00 00                	add    %al,(%rax)
    3deb:	00 00                	add    %al,(%rax)
    3ded:	00 00                	add    %al,(%rax)
    3def:	00 0c 00             	add    %cl,(%rax,%rax,1)
    3df2:	00 00                	add    %al,(%rax)
    3df4:	00 00                	add    %al,(%rax)
    3df6:	00 00                	add    %al,(%rax)
    3df8:	00 10                	add    %dl,(%rax)
    3dfa:	00 00                	add    %al,(%rax)
    3dfc:	00 00                	add    %al,(%rax)
    3dfe:	00 00                	add    %al,(%rax)
    3e00:	0d 00 00 00 00       	or     $0x0,%eax
    3e05:	00 00                	add    %al,(%rax)
    3e07:	00 5c 12 00          	add    %bl,0x0(%rdx,%rdx,1)
    3e0b:	00 00                	add    %al,(%rax)
    3e0d:	00 00                	add    %al,(%rax)
    3e0f:	00 19                	add    %bl,(%rcx)
    3e11:	00 00                	add    %al,(%rax)
    3e13:	00 00                	add    %al,(%rax)
    3e15:	00 00                	add    %al,(%rax)
    3e17:	00 d0                	add    %dl,%al
    3e19:	3d 00 00 00 00       	cmp    $0x0,%eax
    3e1e:	00 00                	add    %al,(%rax)
    3e20:	1b 00                	sbb    (%rax),%eax
    3e22:	00 00                	add    %al,(%rax)
    3e24:	00 00                	add    %al,(%rax)
    3e26:	00 00                	add    %al,(%rax)
    3e28:	08 00                	or     %al,(%rax)
    3e2a:	00 00                	add    %al,(%rax)
    3e2c:	00 00                	add    %al,(%rax)
    3e2e:	00 00                	add    %al,(%rax)
    3e30:	1a 00                	sbb    (%rax),%al
    3e32:	00 00                	add    %al,(%rax)
    3e34:	00 00                	add    %al,(%rax)
    3e36:	00 00                	add    %al,(%rax)
    3e38:	d8 3d 00 00 00 00    	fdivrs 0x0(%rip)        # 3e3e <_DYNAMIC+0x5e>
    3e3e:	00 00                	add    %al,(%rax)
    3e40:	1c 00                	sbb    $0x0,%al
    3e42:	00 00                	add    %al,(%rax)
    3e44:	00 00                	add    %al,(%rax)
    3e46:	00 00                	add    %al,(%rax)
    3e48:	08 00                	or     %al,(%rax)
    3e4a:	00 00                	add    %al,(%rax)
    3e4c:	00 00                	add    %al,(%rax)
    3e4e:	00 00                	add    %al,(%rax)
    3e50:	f5                   	cmc
    3e51:	fe                   	(bad)
    3e52:	ff 6f 00             	ljmp   *0x0(%rdi)
    3e55:	00 00                	add    %al,(%rax)
    3e57:	00 c0                	add    %al,%al
    3e59:	03 00                	add    (%rax),%eax
    3e5b:	00 00                	add    %al,(%rax)
    3e5d:	00 00                	add    %al,(%rax)
    3e5f:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 3e65 <_DYNAMIC+0x85>
    3e65:	00 00                	add    %al,(%rax)
    3e67:	00 b8 04 00 00 00    	add    %bh,0x4(%rax)
    3e6d:	00 00                	add    %al,(%rax)
    3e6f:	00 06                	add    %al,(%rsi)
    3e71:	00 00                	add    %al,(%rax)
    3e73:	00 00                	add    %al,(%rax)
    3e75:	00 00                	add    %al,(%rax)
    3e77:	00 e0                	add    %ah,%al
    3e79:	03 00                	add    (%rax),%eax
    3e7b:	00 00                	add    %al,(%rax)
    3e7d:	00 00                	add    %al,(%rax)
    3e7f:	00 0a                	add    %cl,(%rdx)
    3e81:	00 00                	add    %al,(%rax)
    3e83:	00 00                	add    %al,(%rax)
    3e85:	00 00                	add    %al,(%rax)
    3e87:	00 af 00 00 00 00    	add    %ch,0x0(%rdi)
    3e8d:	00 00                	add    %al,(%rax)
    3e8f:	00 0b                	add    %cl,(%rbx)
    3e91:	00 00                	add    %al,(%rax)
    3e93:	00 00                	add    %al,(%rax)
    3e95:	00 00                	add    %al,(%rax)
    3e97:	00 18                	add    %bl,(%rax)
    3e99:	00 00                	add    %al,(%rax)
    3e9b:	00 00                	add    %al,(%rax)
    3e9d:	00 00                	add    %al,(%rax)
    3e9f:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 3ea5 <_DYNAMIC+0xc5>
	...
    3ead:	00 00                	add    %al,(%rax)
    3eaf:	00 03                	add    %al,(%rbx)
    3eb1:	00 00                	add    %al,(%rax)
    3eb3:	00 00                	add    %al,(%rax)
    3eb5:	00 00                	add    %al,(%rax)
    3eb7:	00 e8                	add    %ch,%al
    3eb9:	3f                   	(bad)
    3eba:	00 00                	add    %al,(%rax)
    3ebc:	00 00                	add    %al,(%rax)
    3ebe:	00 00                	add    %al,(%rax)
    3ec0:	02 00                	add    (%rax),%al
    3ec2:	00 00                	add    %al,(%rax)
    3ec4:	00 00                	add    %al,(%rax)
    3ec6:	00 00                	add    %al,(%rax)
    3ec8:	48 00 00             	rex.W add %al,(%rax)
    3ecb:	00 00                	add    %al,(%rax)
    3ecd:	00 00                	add    %al,(%rax)
    3ecf:	00 14 00             	add    %dl,(%rax,%rax,1)
    3ed2:	00 00                	add    %al,(%rax)
    3ed4:	00 00                	add    %al,(%rax)
    3ed6:	00 00                	add    %al,(%rax)
    3ed8:	07                   	(bad)
    3ed9:	00 00                	add    %al,(%rax)
    3edb:	00 00                	add    %al,(%rax)
    3edd:	00 00                	add    %al,(%rax)
    3edf:	00 17                	add    %dl,(%rdi)
    3ee1:	00 00                	add    %al,(%rax)
    3ee3:	00 00                	add    %al,(%rax)
    3ee5:	00 00                	add    %al,(%rax)
    3ee7:	00 80 06 00 00 00    	add    %al,0x6(%rax)
    3eed:	00 00                	add    %al,(%rax)
    3eef:	00 07                	add    %al,(%rdi)
    3ef1:	00 00                	add    %al,(%rax)
    3ef3:	00 00                	add    %al,(%rax)
    3ef5:	00 00                	add    %al,(%rax)
    3ef7:	00 c0                	add    %al,%al
    3ef9:	05 00 00 00 00       	add    $0x0,%eax
    3efe:	00 00                	add    %al,(%rax)
    3f00:	08 00                	or     %al,(%rax)
    3f02:	00 00                	add    %al,(%rax)
    3f04:	00 00                	add    %al,(%rax)
    3f06:	00 00                	add    %al,(%rax)
    3f08:	c0 00 00             	rolb   $0x0,(%rax)
    3f0b:	00 00                	add    %al,(%rax)
    3f0d:	00 00                	add    %al,(%rax)
    3f0f:	00 09                	add    %cl,(%rcx)
    3f11:	00 00                	add    %al,(%rax)
    3f13:	00 00                	add    %al,(%rax)
    3f15:	00 00                	add    %al,(%rax)
    3f17:	00 18                	add    %bl,(%rax)
    3f19:	00 00                	add    %al,(%rax)
    3f1b:	00 00                	add    %al,(%rax)
    3f1d:	00 00                	add    %al,(%rax)
    3f1f:	00 fb                	add    %bh,%bl
    3f21:	ff                   	(bad)
    3f22:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f25:	00 00                	add    %al,(%rax)
    3f27:	00 00                	add    %al,(%rax)
    3f29:	00 00                	add    %al,(%rax)
    3f2b:	08 00                	or     %al,(%rax)
    3f2d:	00 00                	add    %al,(%rax)
    3f2f:	00 fe                	add    %bh,%dh
    3f31:	ff                   	(bad)
    3f32:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f35:	00 00                	add    %al,(%rax)
    3f37:	00 80 05 00 00 00    	add    %al,0x5(%rax)
    3f3d:	00 00                	add    %al,(%rax)
    3f3f:	00 ff                	add    %bh,%bh
    3f41:	ff                   	(bad)
    3f42:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f45:	00 00                	add    %al,(%rax)
    3f47:	00 01                	add    %al,(%rcx)
    3f49:	00 00                	add    %al,(%rax)
    3f4b:	00 00                	add    %al,(%rax)
    3f4d:	00 00                	add    %al,(%rax)
    3f4f:	00 f0                	add    %dh,%al
    3f51:	ff                   	(bad)
    3f52:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f55:	00 00                	add    %al,(%rax)
    3f57:	00 68 05             	add    %ch,0x5(%rax)
    3f5a:	00 00                	add    %al,(%rax)
    3f5c:	00 00                	add    %al,(%rax)
    3f5e:	00 00                	add    %al,(%rax)
    3f60:	f9                   	stc
    3f61:	ff                   	(bad)
    3f62:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f65:	00 00                	add    %al,(%rax)
    3f67:	00 03                	add    %al,(%rbx)
	...

