# New ports collection makefile for:    etoile
# Date created:         21 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11/etoile/Makefile,v 1.7 2007/11/15 18:05:47 laffer1 Exp $
# $FreeBSD: ports/x11/etoile/Makefile,v 1.8 2007/01/31 18:18:12 dinoex Exp $
#

PORTNAME=	etoile
PORTVERSION=	0.2.1
CATEGORIES=	x11 gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Metaport for Etoile desktop
LICENSE=	agg
# etoile is under several licenses including bsd and gpl.

NO_BUILD=	yes
NO_INSTALL=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_GUI=	yes
USE_GNUSTEP_BACK=	yes
.if !defined(WITH_GNUSTEP_SINGLE_BACKEND)
USE_GNUSTEP_XLIB=	yes
USE_GNUSTEP_LIBART=	yes
USE_GNUSTEP_CAIRO=	yes
.endif

USE_GNUSTEP_SYSTEM_LIBS+=	\
	XWindowServerKit:x11/etoile-xwindowserverkit \
	WorkspaceCommKit:sysutils/etoile-system \

# TrackerKit:deskutils/etoile-trackerkit \
#	ServicesBarKit:deskutils/etoile-servicesbarkit \
#	ExtendedWorkspace:deskutils/etoile-extendedworkspacekit \

USE_GNUSTEP_LOCAL_LIBS+=	\
	EtoileFoundation:devel/etoile-foundation \
	EtoileUI:deskutils/etoile-ui \
	IconKit:x11-themes/etoile-iconkit \
	BookmarkKit:www/etoile-bookmarkkit \
	CollectionKit:devel/etoile-collectionkit \
	UnitKit:devel/etoile-unitkit \
	PaneKit:deskutils/etoile-panekit \
	RSSKit:www/etoile-rsskit \
	PopplerKit:graphics/popplerkit \
	OgreKit:textproc/etoile-ogrekit \
	LuceneKit:textproc/etoile-lucenekit \
	DistributedView:graphics/etoile-distributedview \
	Addresses:deskutils/etoile-addresseskit \
	InspectorKit:deskutils/etoile-inspectorkit \

#	SQLClient:databases/sqlclient \
#	SystemConfig:deskutils/etoile-systemconfig \
#	MultimediaKit:multimedia/etoile-multimediakit \


USE_GNUSTEP_SYSTEM_BUNDLES+=	\
	EtoileBehavior:sysutils/etoile-behavior \
	EtoileMenus:x11-themes/etoile-wildmenus \

USE_GNUSTEP_LOCAL_BUNDLES+=	\

USE_GNUSTEP_SYSTEM_THEMES+=	\
	Camaelon:x11-themes/etoile-camaelon \

USE_GNUSTEP_SYSTEM_APPS+=	\
	AZDock:x11-wm/etoile-azdock \
	AZBackground:x11-themes/etoile-azbackground \
	Azalea:x11-wm/etoile-azalea \
	OuterSpace:deskutils/etoile-outerspace \

USE_GNUSTEP_LOCAL_APPS+=	\
	EtoileMenuServer:deskutils/etoile-menuserver \
	Typewriter:editors/etoile-typewriter \
	StepChat:net-im/etoile-stepchat \
	DictionaryReader:deskutils/etoile-dictionaryreader \

#	iTerm:x11/etoile-iterm \
#	Installer:sysutils/etoile-installer \
#	Hardware:deskutils/etoile-hardware \
#	LookAndBehavior:deskutils/etoile-lookandbehavior \
#	Vindaloo:graphics/vindaloo \
#	Babbler:multimedia/etoile-babbler \
#	Mollusk:www/etoile-mollusk \

#	Mantella:www/etoile-mantella \

USE_GNUSTEP_LOCAL_TOOLS+=	\
	ioobjc:lang/etoile-io \

.include <bsd.port.mk>
