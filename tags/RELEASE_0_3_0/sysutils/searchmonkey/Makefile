# $MidnightBSD: mports/sysutils/searchmonkey/Makefile,v 1.2 2008/05/31 19:41:15 laffer1 Exp $
# $FreeBSD: ports/sysutils/searchmonkey/Makefile,v 1.7 2006/12/05 15:12:57 sat Exp $

PORTNAME=	searchmonkey
PORTVERSION=	0.8.1
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20%5Bstable%5D

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Search using regexes for file names and text
LICENSE=	lgpl

USE_GNOME=	gtk20
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
