# New ports collection makefile for:	jupp
# Date created:		May 20 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/jupp/Makefile,v 1.4 2010/04/26 13:07:29 laffer1 Exp $
#

PORTNAME=	jupp
PORTVERSION=	3.1.15
CATEGORIES=	editors
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/jupp/ \
		http://pub.allbsd.org/MirOS/dist/jupp/
DISTFILES=	joe-3.1jupp15.cpio.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The editor which sucks less.
LICENSE=	gpl

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS=      joe-[0-9]*

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GMAKE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

MAN1=		joe.1

post-extract:
	${CHMOD} 755 ${WRKSRC}/configure

.include <bsd.port.mk>
