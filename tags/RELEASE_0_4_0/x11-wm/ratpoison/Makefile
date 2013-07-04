# $MidnightBSD: mports/x11-wm/ratpoison/Makefile,v 1.5 2013/02/22 03:19:41 laffer1 Exp $

PORTNAME=	ratpoison
PORTVERSION=	1.4.5
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SAVANNAH} \
		http://mirror.4bit.ws/
MASTER_SITE_SUBDIR=	ratpoison

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple window manager with no fat library dependencies
LICENSE=	gpl2

USE_XORG=	xext xinerama xtst
GNU_CONFIGURE=	yes

OPTIONS=	GDM_SUPPORT "Install session data files for GDM" off

SUB_FILES=	ratpoison.desktop

.include <bsd.mport.options.mk>

post-patch:
	${REINPLACE_CMD} -e 's|bash|sh|g' ${WRKSRC}/contrib/allwindows.sh

.if defined (WITH_GDM_SUPPORT)
PLIST_SUB+=	WITH_GDM=""

post-install:
	${MKDIR} ${PREFIX}/etc/dm/Sessions
	${INSTALL_DATA} ${WRKDIR}/ratpoison.desktop ${PREFIX}/etc/dm/Sessions/
.else
PLIST_SUB+=	WITH_GDM="@comment "
.endif

.if defined(NOPORTDOCS)
INSTALL_TARGET=	SUBDIRS=src install-exec
.else
MAN1=		ratpoison.1
INFO=		ratpoison
.endif

.include <bsd.port.mk>
