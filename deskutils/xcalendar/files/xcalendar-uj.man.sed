.de EX		\"Begin example
.ne 5
.if n .sp 1
.if t .sp .5
.nf
.in +.5i
..
.de EE
.fi
.in -.5i
.if n .sp 1
.if t .sp .5
..
.TH xcalendar 1 "6 June 1994" "X Version 11"
.SH ̾��
xcalendar - X11 �ѤΥ��������ȥ��
.SH ��
.PP
\fBxcalendar \fP[month \fp[year\fp]\fP]
.PP
.SH ����
.PP
\fIxcalendar\fP �ϥ�ⵡǽ����ä�����ץ�����÷����������ץ����Ǥ���
���Υץ����� X Toolkit �� Athena �ޤ��� Motif ���������å�
(����ѥ�����Υ��ץ����ǻ���) �Ǻ���Ƥ��ޤ���
.PP
���ޥ�ɥ饤��� month �� year �����ꤵ��ʤ��ä����ˤ�
���ߤ�ǯ�ȷ���ꤵ��ޤ���
.PP
.SH ���
.PP
���դξ�ǥޥ����κ��ܥ���򥯥�å�����ȥƥ����ȥ��ǥ�������ư����
�ƥ����Ȥ��Խ�����¸���Ǥ��ޤ������Υƥ����ȤϤ������դ˴�Ϣ�Ť���졢
�夫�饨�ǥ����ǳ������ɤ߽񤭤Ǥ��ޤ���
�ƥ����Ȥ� calendarDir �꥽�����ǻ��ꤵ�줿�ǥ��쥯�ȥ� (�ǥե���ȤǤ�
~/Calendar) ����¸����ޤ������ǥ�������ϸġ������դ˴�Ϣ�Ť���줿���Ƥ�
�õ�뤳�Ȥ�Ǥ��ޤ����ޤ����ǥ���������ե�٥�κ����ˤ��������
����å���������ΰ�ư���Ǥ��ޤ������˳����Ƥ������˰�ư�������ϡ�
��å�������ɽ�����졢���ǥ�����ɽ�������Ǥ��ʤ��⡼�ɤˤʤ�ޤ���
.PP
Ʊ�ͤ˥ᥤ�󥦥���ɥ��ˤ����ƺ��������ե�٥�κ����ˤ��������
����å����뤳�Ȥˤ�ꡢ����ư���뤳�Ȥ�Ǥ��ޤ���
.PP
ShowEntries �ؿ���¹Ԥ���ȡ����η�ˤ������Ƥ�ͽ���ϥ��饤��ɽ���Ǥ��ޤ���
�ǥե���ȤǤϤ��δؿ��� (ǯ��ɽ������Ƥ���) �����ȥ륦����ɥ������
�ޥ����κ��ܥ���򲡤����Ȥˤ��¹Ԥ���ޤ���
�⤦���ٲ��������Ƥ�ͽ��Υϥ��饤��ɽ����ߤ�ޤ���
.PP
�ֽ����פ������ǥ����β������ˤ���ƥ����ȥ��������åȤ�ɽ������ޤ���
�����Ͻ����ե����� (������ holidayfile ����) �����ɤ߼���ޤ���
�ե�����η����� mm/dd/yyyy �������� �ǡ����դ����Ƥδ֤ϥ��֤Ƕ��ڤ��ޤ���
���ߤΤȤ���磻��ɥ����ɤϻȤ��ޤ���
.SH �礱�Ƥ��뵡ǽ
.PP
�����������ʵ�ǽ���ͤ�����Ǥ��礦�����Ȥ��к�����ͽ���ưŪ��
��ᤷ����«�򸡺�����Ŭ�ڤʻ��֤˥��顼�� (��ޥ����) ���Ĥ餹�Ȥ�����ǽ��
�ͤ����ޤ����ºݡ����Τ褦�ʵ�ǽ��¸����� \fIxcalendar+\fP �Ȥ��� perl 
������ץȤ�����ޤ��������餯�������ˤ� \fIxcalendar\fP �Ϥ��ε�ǽ��
��¢����Ǥ��礦��
.PP
.SH �꥽����
.PP
�꥽�����ǡ����١����ϥץ����θ��ɤ����ѹ����ޤ���
�ե���Ȥ��������٥롢����¾�Υ��������åȤǻ��Ѥ���Ƥ���꥽�������ѹ���ǽ��
�������ε�ǽ�λȤ��Ӥΰ�Ĥ��������̾���ѹ��Ǥ���
.PP
�ѹ���ǽ���͡��Υ꥽�����Υ��������å�̾�ˤϰʲ��Τ褦�ʤ�Τ�����ޤ���
.PP
.EX 0
XCalendar    - ���ץꥱ������󥯥饹
xcalendar    - �ȥåץ�٥�ڥ���
controls     - ����ȥ���ѥͥ�
quitButton   - ��λ�ܥ���
helpButton   - �إ�ץܥ���
date         - ���ե�٥�
calendar     - ���������ڥ���
daynumbers   - ���եե졼��
1-49         - ���եܥ���
daynames     - �����ե졼��
MON,TUE,WED,THU,FRI,SAT,SUN - �����ܥ���
helpWindow   - �إ�ץ�����ɥ�
bcontrols    - ��ܥ���ե졼��
prev         - ���ܥ���
succ         - ���ܥ���
cdate        - ���������ե��������å�
dayEditor    - ���ǥ����ݥåץ��å�
editorFrame  - ���ǥ����ե졼��
editorTitle  - ���ǥ��������ȥ�
editor       - ���ǥ���
holiday      - �����ƥ�����
daybuttons   - ���եܥ���ե졼��
prevday      - �����ܥ���
succday      - �����ܥ���
editorControls - ����ȥ���ѥͥ�
doneButton   - ��λ�ܥ���
saveButton   - ��¸�ܥ���
clearEntry   - �õ�ܥ���
.EE
.PP
���ץꥱ���������ͭ�꥽����:
.PP
.EX 0
reverseVideoMark  - True �ξ���ͽ���ȿž������Ĵɽ���ˤ��ޤ���
                    �ǥե���ȤǤ�����ǥ����ץ쥤�Ǥ� True �ǡ�
                    ���顼�ǥ����ץ쥤�Ǥ� Falase �Ǥ���

setMarkBackground - True ���� reverseVideoMark �� False �ξ�硢
                    ͽ��ζ�Ĵɽ�����طʿ��� markBackground ��
                    �ʤ�ޤ���

markBackground    - ͽ���Ĵɽ������ݤ˻Ȥ����طʿ���

setMarkForeground - setMarkBackground ��Ʊ�ͤǤ���

markForeground    - ͽ���Ĵɽ������ݤ˻Ȥ������ʿ���

\fIsetMarkBackground\fP �� \fIsetMarkForeground\fP ���ȹ�碌��
�ɤΤ褦���ͤǤ⹽���ޤ���


january,february,..,december - �����Υ꥽�����Ƿ��٥�η�̾��
                    oldStyle (��������) ���Υե�����̾������ˡ��
                    �ѹ��Ǥ��ޤ���

firstDay          - 1-7 �������ǽ���ɤ���������Ϥ�뤫���ꤷ�ޤ���
                    �ǥե���Ȥ� 7 (����) �Ǥ���

markOnStartup     - True �ξ�絯ư������ͽ���ޡ������ޤ���
                    �ǥե����: True��
.\" ��ʸ�� False

helpFile          - xcalendar.hlp �ե�����Υե�ѥ�̾��
                    �ǥե����: %%XCALENDAR_LIBDIR%%/xcalendar.hlp

textBufferSize    - ���ե��ǥ����Υƥ����ȥХåե��κ��祵������
                    �ǥե����: 2048��

calendarDir       - $HOME/Calendar �ʳ��Υǥ��쥯�ȥ�˥�������
                    �ե��������¸������Υѥ�̾

holidayFile       - ���������Τ��Ѥ���ե�����Υѥ�̾��
                    �ǥե����: %%XCALENDAR_LIBDIR%%/xcalendar.hol

oldStyle          - �ե������̿̾��§�Ȥ��ƿ�������������
                    (xcyyyymmdd) �ǤϤʤ� version 3.0 ����Ӥ���
                    �����Υե�����̿̾��§ (xcDAYmonYEAR) �����
                    ���ޤ��������� DAY �� YEAR �Ͽ����� mon �Ϸ�
                    �κǽ��3ʸ���Ǥ���
                    �ǥե����: True

markCurrent       - True �ξ�硢���������դ�ޡ������ޤ� (����
                    ����硣���顼�ǥ����ץ쥤�ǤΤ������Ǥ�)��
                    �ǥե����: False

updateCurrent     - ���������դΥޡ����󥰤򹹿�����ֳ֤��ÿ���
                    �ǥե����: 60

currentForeground - ���������դ�Ĵɽ������ݤ����ʿ���

markHoliday       - True �ξ�硢������ޡ������ޤ� (�������硢
                    ���顼�ǥ����ץ쥤�ǤΤ������Ǥ�)��
                    �ǥե����: False

holidayForeground - ������Ĵɽ������ݤ����ʿ�

monthnames        - cdate �ˤ��������դ�ե����ޥåȤ���ݤ��Ѥ���
                    ��̾�� '/' �Ƕ��ڤä�ʸ����

monthnms          - cdate �ˤ��������դ�ե����ޥåȤ���ݤ��Ѥ���
                    ��̾��ά�Τ� '/' �Ƕ��ڤä�ʸ����

daynames          - cdate �ˤ��������դ�ե����ޥåȤ���ݤ��Ѥ���
                    ����̾�� '/' �Ƕ��ڤä�ʸ����

daynms            - cdate �ˤ��������դ�ե����ޥåȤ���ݤ��Ѥ���
                    ����̾��ά�Τ� '/' �Ƕ��ڤä�ʸ����

date              - cdate �ˤ��������դ�ե����ޥåȤ���ʸ����
                    ��ᤵ���ե����ޥå�ʸ���ϼ��ΤȤ���:

.in +9
.nf
%W      �����δ�����̾��
%w      ������ά��
%M      ��̾�δ�����̾��
%m      ��̾��ά��
%d      �� (����)
%Y      ������ǯ�� (4 ��)
%y      2 ���ǯ��
.fi
.in -9

                    �ǥե����: "%W, %M %d";
.EE
.SH �ǥե���ȤΥ꥽�����ǡ����١���
.EX 0
*international: TRUE
!
*showGrip:		False
*calendar*internalBorderWidth: 0
*input:		True
*controls*resize: False
*bcontrols*resize: False
*daybuttons*resize: False
*resizable: True
*title: XCalendar v.4.0
*dayEditor.title: Day Editor
*helpWindow.title: XCalendar Help
*Font: 8x13
*FontList: 8x13

*helpFile:	%%XCALENDAR_LIBDIR%%/xcalendar.hlp
*holidayFile:   %%XCALENDAR_LIBDIR%%/xcalendar.hol

*firstDay:		7

*labelType: XmSTRING
*prev*Label: ���
*succ*Label: ���
*prevday*Label: ����
*succday*Label: ����
*helpButton*Label: ����
*quitButton*Label: ����

*daynames.SUN.label: \\ ��
*daynames.MON.label: \\ ��
*daynames.TUE.label: \\ ��
*daynames.WED.label: \\ ��
*daynames.THU.label: \\ ��
*daynames.FRI.label: \\ ��
*daynames.SAT.label: \\ ��

*monthnames:	1/2/3/4/5/6/7/8/9/10/11/12
*monthnms:	1/2/3/4/5/6/7/8/9/10/11/12
*daynames:	������/������/������/������/������/������/������
*daynms:	��/��/��/��/��/��/��                            
*date:		%M��%d��(%W)


#ifdef COLOR
! colors
*Background: lightgray
*markBackground: Steel Blue
*daynames*Background: lightgray
*daynames.SUN*Foreground: Red
*daynames.SAT*Foreground: Black
*daynumbers*Foreground:   Black
*daynumbers.1*Foreground: Red
*daynumbers.8*Foreground: Red
*daynumbers.15*Foreground: Red
*daynumbers.22*Foreground: Red
*daynumbers.29*Foreground: Red
*daynumbers.36*Foreground: Red
*helpButton*Background: slategray
*helpButton*Foreground: White
*quitButton*Background: slategray
*quitButton*Foreground: White
*editorTitle*Background: lightgray
*editorTitle*Foreground: Black
*editorControls*Background: lightgray
*editorControls*Command.Background: slategray
*editorControls*Command.Foreground: White
*editorControls*XmPushButton.Background: slategray
*editorControls*XmPushButton.Foreground: White
#endif

*setMarkBackground: True
*markOnStartup: True
*markCurrent: True
*currentForeground: Blue
*markHoliday: True
*holidayForeground: Red

*BorderWidth:		2
*calendar.borderWidth:	1
*borderWidth: 0
*date*borderWidth: 0
*date*vertDistance: 1
*prev*vertDistance: 0
*succ*vertDistance: 0

*controls*date*fontSet:		8x13bold, -*--14-*
*daynames*fontSet:			-*--14-*
*dayEditor*editorTitle*fontSet:	8x13bold, -*--14-*
*helpWindow*editorTitle*fontSet:	8x13bold, -*--14-*

*helpButton*vertDistance: 5
*quitButton*vertDistance: 5
*editorTitle*vertDistance: 5
*cdate*vertDistance: 5

*editorControls*doneButton*label: ����
*editorControls*saveButton*label: ��¸
*editorControls*clearEntry*label: �ä��Ƥʤ��ʤ�
*doneButton*labelString: ����
*saveButton*labelString: ��¸
*clearEntry*labelString: �ä��Ƥʤ��ʤ�

*dayEditor*geometry: 300x150
*helpWindow*geometry: 600x350

*dayEditor*fontSet:			-*--14-*
*controls*fontSet:			-*--14-*
*bcontrols*fontSet:			-*--14-*
*editorControls*fontSet:		-*--14-*
*fontSet: 				-*--14-*

!*preeditType: Root
!*preeditType: OffTheSpot
*preeditType: OverTheSpot

*helpWindow*editorTitle*label: �إ��
*helpWindow*editorTitle*labelString: �إ��
*helpWindow*rows: 15
*helpWindow*columns: 80
*rows:7
*columns: 30

*dayEditor*Paned*editor.width: 300
*dayEditor*Paned*editor.height: 150
*helpWindow*Paned*editor.width: 600
*helpWindow*Paned*editor.height: 350

*bcontrols*borderWidth: 0
*prev*highlightThickness: 0
*succ*highlightThickness: 0

*prevday*highlightThickness: 0
*succday*highlightThickness: 0
*daybuttons*borderWidth: 0

*Scrollbar.borderWidth: 1
*Text*scrollVertical: whenNeeded
*scrollHorizontal: Never
*helpWindow*scrollHorizontal: Always
*holiday*cursorPositionVisible: False
*holiday*displayCaret: False
*helpWindow*cursorPositionVisible: False
*helpWindow*displayCaret: False

! Keyboard accelerators
*editorControls*doneButton*accelerators: #override \\n\\
	Meta<Key>q: set() notify() reset() \\n
*editorControls*saveButton*accelerators: #override \\n\\
	Meta<Key>s: set() notify() reset() \\n
*editorControls*clearEntry*accelerators: #override \\n\\
	Meta<Key>c: set() notify() reset() \\n

*daybuttons*prevday*accelerators: #override \\n\\
	Meta<Key>p: set() notify() reset() \\n
*daybuttons*succday*accelerators: #override \\n\\
	Meta<Key>n: set() notify() reset() \\n

*prev*accelerators: #override \\n\\
	<Key>p: set() notify() reset() \\n
*succ*accelerators: #override \\n\\
	<Key>n: set() notify() reset() \\n
*quitButton*accelerators: #override \\n\\
	<Key>q: set() notify() \\n

*XmText.translations: #override\\n\\
.in +9
.nf
Ctrl <Key>b:            backward-character()\\n\\
Alt <Key>b:             backward-word()\\n\\
Meta <Key>b:            backward-word()\\n\\
Shift Alt <Key>b:       backward-word(extend)\\n\\
Shift Meta <Key>b:      backward-word(extend)\\n\\
Alt <Key>[:             backward-paragraph()\\n\\
Meta <Key>[:            backward-paragraph()\\n\\
Shift Alt <Key>[:       backward-paragraph(extend)\\n\\
Shift Meta <Key>[:      backward-paragraph(extend)\\n\\
Alt <Key><:             beginning-of-file()\\n\\
Meta <Key><:            beginning-of-file()\\n\\
Ctrl <Key>a:            beginning-of-line()\\n\\
Shift Ctrl <Key>a:      beginning-of-line(extend)\\n\\
Ctrl <Key>osfInsert:    copy-clipboard()\\n\\
Shift <Key>osfDelete:   cut-clipboard()\\n\\
Shift <Key>osfInsert:   paste-clipboard()\\n\\
Alt <Key>>:             end-of-file()\\n\\
Meta <Key>>:            end-of-file()\\n\\
Ctrl <Key>e:            end-of-line()\\n\\

Shift Ctrl <Key>e:      end-of-line(extend)\\n\\
Ctrl <Key>f:            forward-character()\\n\\
Alt <Key>]:             forward-paragraph()\\n\\
Meta <Key>]:            forward-paragraph()\\n\\
Shift Alt <Key>]:       forward-paragraph(extend)\\n\\
Shift Meta <Key>]:      forward-paragraph(extend)\\n\\
Ctrl Alt <Key>f:        forward-word()\\n\\
Ctrl Meta <Key>f:       forward-word()\\n\\
Ctrl <Key>d:            kill-next-character()\\n\\
Ctrl <Key>h:            kill-previous-character()\\n\\
Alt <Key>BackSpace:     kill-previous-word()\\n\\
Meta <Key>BackSpace:    kill-previous-word()\\n\\
Ctrl <Key>w:            key-select() kill-selection()\\n\\
Ctrl <Key>y:            unkill()\\n\\
Ctrl <Key>k:            kill-to-end-of-line()\\n\\
Alt <Key>Delete:        kill-to-start-of-line()\\n\\
Meta <Key>Delete:       kill-to-start-of-line()\\n\\
Ctrl <Key>o:            newline-and-backup()\\n\\
Ctrl <Key>j:            newline-and-indent()\\n\\
Ctrl <Key>n:            next-line()\\n\\
Ctrl <Key>osfLeft:      page-left()\\n\\
Ctrl <Key>osfRight:     page-right()\\n\\
Ctrl <Key>p:            previous-line()\\n\\
Ctrl <Key>g:            process-cancel()\\n\\
Ctrl <Key>l:            redraw-display()\\n\\
Ctrl <Key>v:            next-page()\\n\\
Meta <Key>v:            previous-page()\\n\\
Ctrl <Key>osfDown:      next-page()\\n\\
Ctrl <Key>osfUp:        previous-page()\\n\\
Ctrl <Key>space:        set-anchor()\\n
.fi 
.in -9 
.EE
.SH ��Ϣ�ե�����
.PP
$HOME/Calendar/*, %%XCALENDAR_LIBDIR%%/xcalendar.hlp,
%%XCALENDAR_LIBDIR%%/xcalendar.hol
.PP
.SH ��Ϣ����
xrdb(1), xcalendar+(1)
.PP
.SH �Х�
.PP
�����Ĥ�����Ȼפ��ޤ���
�⤷���Ĥ������ (bingle@cs.purdue.edu) �˶����Ƥ���������
.PP
.SH ���
.PP
Copyright 1988 by Massachusetts Institute of Technology
.br
Roman J. Budzianowski, MIT Project Athena

Copyright 1990-1994 by Purdue University
.br
Richard Bingle, Department of Computer Sciences

��ĥ / ���:
.br
Beth Chaney
.br
Purdue University, Department of Computer Sciences

Mike Urban
.br
Jet Propulsion Labs, NASA

Joel Neisen
.br
Minnesota Supercomputer Center

Hiroshi Kuribayashi
.br
Omron Corp.
