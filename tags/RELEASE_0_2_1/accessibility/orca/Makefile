# New ports collection makefile for:	orca
# Date created:				25 Jul 2006
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/accessibility/orca/Makefile,v 1.3 2008/03/11 23:32:04 laffer1 Exp $
# $FreeBSD: ports/accessibility/orca/Makefile,v 1.9 2007/10/29 11:32:32 ahze Exp $
#   $MCom: ports/accessibility/orca/Makefile,v 1.32 2007/10/13 21:13:14 marcus Exp $
#

PORTNAME=	orca
PORTVERSION=	2.22.2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scriptable screen reader
LICENSE=	lgpl

LIB_DEPENDS=	gnome-mag.2:${PORTSDIR}/accessibility/gnome-mag
BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

LATEST_LINK=	gnome-orca

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui atspi gnomespeech pygnome2
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		orca.1

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/src/orca/orca.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
	    	${WRKSRC}/src/orca/orca_i18n.py

.include <bsd.port.mk>
