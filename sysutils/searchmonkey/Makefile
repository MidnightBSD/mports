# New ports collection makefile for:	searchmonkey
# Date created:		26 August 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/searchmonkey/Makefile,v 1.1 2007/04/08 06:12:13 laffer1 Exp $
# $FreeBSD: ports/sysutils/searchmonkey/Makefile,v 1.7 2006/12/05 15:12:57 sat Exp $
#

PORTNAME=	searchmonkey
PORTVERSION=	0.7.4
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Search using regexes for file names and text

USE_GNOME=	gtk20
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
PLIST_FILES=	bin/${PORTNAME} share/pixmaps/${PORTNAME}-32x32.png
PLIST_DIRS=	share/pixmaps
CFLAGS=	-I${LOCALBASE}/include
LDFLAGS=-L${LOCALBASE}/lib

.include <bsd.port.mk>
