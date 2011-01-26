# New ports collection makefile for:	ratpoison
# Date created:		January 20, 2001
# Whom:			Gergely Nagy <8@free.bsd.hu>
#
# $MidnightBSD: mports/x11-wm/ratpoison/Makefile,v 1.2 2007/10/25 04:23:14 laffer1 Exp $
# $FreeBSD: ports/x11-wm/ratpoison/Makefile,v 1.15 2007/02/04 06:43:24 rafan Exp $
#

PORTNAME=	ratpoison
PORTVERSION=	1.4.2
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple window manager with no fat library dependencies
LICENSE=	gpl2

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

USE_XLIB=	yes
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
