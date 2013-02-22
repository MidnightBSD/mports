# $MidnightBSD: mports/x11-wm/ratpoison/Makefile,v 1.3 2007/10/25 04:23:48 laffer1 Exp $

PORTNAME=	ratpoison
PORTVERSION=	1.4.2
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple window manager with no fat library dependencies
LICENSE=	gpl2

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

USE_XORG=	x11
GNU_CONFIGURE=	yes

OPTIONS=	GDM_SUPPORT "Install session data files for GDM" off

SUB_FILES=	ratpoison.desktop

.include <bsd.port.pre.mk>

post-patch:
.for file in rpws allwindows.sh
	${REINPLACE_CMD} '1s|!\(/bin/bash\)|!/usr/local\1|' ${WRKSRC}/contrib/${file}
.endfor

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

.include <bsd.port.post.mk>
