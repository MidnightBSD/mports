# New ports collection makefile for:	pwgen
# Date created:		22 July 2000
# Whom:			Oddbjorn Steffensen <oddbjorn@tricknology.org>
#
# $MidnightBSD: mports/sysutils/pwgen/Makefile,v 1.1 2006/10/24 15:33:44 wintellect Exp $
# $FreeBSD: ports/sysutils/pwgen/Makefile,v 1.7 2004/02/06 13:12:28 trevor Exp $
#

PORTNAME=	pwgen
PORTVERSION=	1.15
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.tricknology.org/ports/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple password generator
LICENSE=	unknown

# The dist makefile does some funky stuff with DESTDIR, over ridden PREFIX gets the 
# job done.
DESTDIRNAME=	NOTUSED

USE_GETOPT_LONG=yes

WRKSRC=		${WRKDIR}/${PORTNAME}-1
MAKE_ENV=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"

MAN1=		pwgen.1
PLIST_FILES=	bin/pwgen

.include <bsd.port.mk>
