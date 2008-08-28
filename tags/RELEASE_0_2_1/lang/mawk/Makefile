# ex:ts=8
# Ports collection makefile for:  mawk
# Date created:			  24 Dec 1998
# Whom:				  Pedro F. Giffuni <giffunip@asme.org>
#
# $MidnightBSD: mports/lang/mawk/Makefile,v 1.1 2007/05/03 07:46:35 laffer1 Exp $
# $FreeBSD: ports/lang/mawk/Makefile,v 1.20 2005/11/15 16:39:49 vs Exp $
#

PORTNAME=	mawk
PORTVERSION=	1.3.3
CATEGORIES=	lang
MASTER_SITES=	ftp://ftp.fu-berlin.de/unix/languages/mawk/ \
		ftp://ftp.whidbey.net/pub/brennan/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of new/posix awk
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MATHLIB="-lm"
ALL_TARGET=	${PORTNAME}

MAN1=		mawk.1
PLIST_FILES=	bin/mawk

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mawk ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/mawk.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
