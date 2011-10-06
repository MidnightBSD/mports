# New ports collection makefile for:	jupp
# Date created:		May 20 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/jupp/Makefile,v 1.7 2011/09/22 12:54:28 laffer1 Exp $
#

PORTNAME=	jupp
PORTVERSION=	3.1.18
CATEGORIES=	editors
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/jupp/ \
		http://pub.allbsd.org/MirOS/dist/jupp/
DISTFILES=	joe-3.1jupp18.cpio.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The editor which sucks less.
LICENSE=	gpl

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS=      joe-[0-9]*

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

MAN1=		joe.1

post-extract:
	${CHMOD} 755 ${WRKSRC}/configure

.include <bsd.port.mk>
