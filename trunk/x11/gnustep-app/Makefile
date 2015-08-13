# $MidnightBSD$

PORTNAME=	gnustep-app
PORTVERSION=	1.19.1
PORTREVISION=	4
CATEGORIES=	x11 gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Metaport for GNUstep applications

LICENSE=	agg

NO_BUILD=	yes
NO_INSTALL=	yes
USES=         gnustep
USE_GNUSTEP=  back base gui
USE_GNUSTEP_PREFIX=	yes

USE_GNUSTEP_SYSTEM_LIBS+=	\
	ScriptKit:lang/gnustep-guile \
	Renaissance:x11-toolkits/renaissance \
	PreferencePanes:deskutils/preferencepanes \
	TrackerKit:deskutils/etoile-trackerkit \
	ExtendedWorkspace:deskutils/etoile-extendedworkspacekit \
	ServicesBarKit:deskutils/etoile-servicesbarkit \
	XWindowServerKit:x11/etoile-xwindowserverkit \
	WorkspaceCommKit:sysutils/etoile-system \

USE_GNUSTEP_LOCAL_LIBS+=	\
	Pantomime:mail/pantomime \
	Addresses:mail/addresses \
	SlideShow:graphics/gnustep-slideshowkit \
	netclasses:net/netclasses \
	EOInterface:databases/gdl2 \
	WizardKit:devel/wizardkit \
	HighlighterKit:devel/highlighterkit \
	Performance:devel/performance \
	SQLClient:databases/sqlclient \
	WebServer:www/webserver \
	StepTalk:lang/steptalk \
	MathArray:math/matharray \
	ObjcUnit:devel/objcunit \
	GSKrab:x11/gskrab \
	UnitKit:devel/etoile-unitkit \
	BookmarkKit:www/etoile-bookmarkkit \
	IconKit:x11-themes/etoile-iconkit \
	RSSKit:www/etoile-rsskit \
	PopplerKit:graphics/popplerkit \
	Toolbox:deskutils/toolboxkit \
	Tryst:net/tryst \
	OgreKit:textproc/etoile-ogrekit \
	LuceneKit:textproc/etoile-lucenekit \
	CollectionKit:devel/etoile-collectionkit \
	EtoileFoundation:devel/etoile-foundation \
	PaneKit:deskutils/etoile-panekit \
	SystemConfig:deskutils/etoile-systemconfig \
	MultimediaKit:multimedia/etoile-multimediakit \
	EtoileSerialize:devel/etoile-serialize \
	CoreObject:devel/etoile-coreobject \
	EtoileUI:deskutils/etoile-ui \
	DistributedView:deskutils/etoile-distributedview \
	InspectorKit:deskutils/etoile-inspectorkit \
	OPMLKit:textproc/etoile-opmlkit \
	ScriptKit:lang/etoile-scriptkit \
	MediaKit:multimedia/etoile-mediakit \
	LanguageKit:lang/etoile-languagekit \
	SmalltalkSupport:lang/etoile-smalltalkkit \
	WebServices:www/webservices \

USE_GNUSTEP_SYSTEM_BUNDLES+=	\
	EtoileMenus:x11-themes/etoile-etoilemenus \
	EtoileBehavior:sysutils/etoile-behavior \

USE_GNUSTEP_LOCAL_BUNDLES+=	\
	Cddb:audio/cddb-bundle	\

USE_GNUSTEP_LOCAL_BURNS+=	\

USE_GNUSTEP_SYSTEM_THEMES+=	\
	Camaelon:x11-themes/etoile-camaelon \

USE_GNUSTEP_LOCAL_THEMES+=	\
	WildMenus:x11-themes/etoile-wildmenus \

USE_GNUSTEP_LOCAL_MENULETS+=	\
	PowerMenulet:sysutils/etoile-powermenulet \
	ServiceMenulet:deskutils/etoile-servicemenulet \

USE_GNUSTEP_LOCAL_ASTS+=	\
	CommentToLog:lang/etoile-lkplugins \

USE_GNUSTEP_SYSTEM_APPS+=	\
	Gorm:devel/gorm \
	ProjectCenter:devel/projectcenter \
	Preferences:deskutils/preferences.app \
	GWorkspace:deskutils/gworkspace \
	TextEdit:editors/textedit \
	Terminal:x11/terminal.app \
	GSPdf:print/gspdf \
	Azalea:x11-wm/etoile-azalea \
	AZDock:x11-wm/etoile-azdock \
	AZBackground:x11-themes/etoile-azbackground \
	AZSwitch:x11-wm/etoile-azswitch \
	Login:x11-wm/etoile-login \
	EtoileMenuServer:deskutils/etoile-menuserver \

USE_GNUSTEP_LOCAL_APPS+=	\
	GNUMail:mail/gnumail \
	EasyDiff:textproc/easydiff \
	Ink:misc/gnustep-examples \
	GSCommander:shells/gscommander \
	ImageViewer:graphics/imageviewer \
	SlideShow:graphics/gnustep-slideshow \
	Preview:graphics/preview \
	oolite:games/oolite \
	TimeMon:sysutils/timemon \
	Gridlock:games/gridlock \
	PRICE:graphics/price \
	EdenMath:math/edenmath \
	TalkSoup:irc/talksoup \
	Zipper:archivers/zipper \
	Ladder:games/gnustep-ladder \
	GTAMSAnalyzer:science/gtamsanalyzer \
	Paje:science/paje \
	AClock:x11-clocks/aclock \
	PhotoClip:graphics/photoclip \
	ProjectManager:devel/projectmanager \
	Ticker:www/gnustep-ticker \
	NoteBook:deskutils/gnustep-notebook \
	Duncan:textproc/duncan \
	Jishyo:misc/jishyo \
	InnerSpace:x11/innerspace \
	FTP:ftp/gnustep-ftp \
	DictionaryReader:deskutils/etoile-dictionaryreader \
	batmon:sysutils/batmon \
	RemoteDesk:net/remotedesk \
	GNUWash:deskutils/gnuwash \
	Poe:multimedia/poe \
	CDPlayer:audio/gnustep-cdplayer \
	Burn:sysutils/burn \
	GScheme:lang/gscheme \
	Mplayer:multimedia/gnustep-mplayer \
	NeXTGo:games/nextgo \
	iTerm:x11/etoile-iterm \
	Installer:sysutils/etoile-installer \
	Hardware:deskutils/etoile-hardware \
	LookAndBehavior:deskutils/etoile-lookandbehavior \
	FreeTar:archivers/freetar \
	CodeEditor:editors/codeeditor \
	Localize:textproc/localize \
	SVGViewer:graphics/svgviewer \
	Vindaloo:graphics/vindaloo \
	AppWrapper:deskutils/appwrapper \
	Pixen:graphics/pixen \
	LuserNET:news/lusernet \
	Popup:textproc/popup \
	Toolbox:deskutils/toolbox \
	Fortunate:games/fortunate \
	TBrowser:net/tryst-examples \
	Typewriter:editors/etoile-typewriter \
	Babbler:multimedia/etoile-babbler \
	Mollusk:www/etoile-mollusk \
	FontManager:x11-fm/etoile-fontmanager \
	ScriptServices:deskutils/etoile-scriptservices \
	Melodie:audio/etoile-melodie \
	StepChat:net-im/etoile-stepchat \
	LaternaMagica:graphics/laternamagica \

USE_GNUSTEP_SYSTEM_TOOLS+=	\
	Idle:x11/etoile-idle \
	Corner:deskutils/etoile-corner \

USE_GNUSTEP_LOCAL_TOOLS+=	\
	zillion:net/zillion \
	adtool:mail/addresses-goodies \
	ioobjc:lang/etoile-io \
	edlc:lang/etoile-compiler \

USE_GNUSTEP_LOCAL_SERVICES+=	\
	LaTeX:textproc/latex-service \

.include <bsd.port.mk>
