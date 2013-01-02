# New ports collection makefile for:	jupp
# Date created:		May 20 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/jupp/Makefile,v 1.8 2011/10/06 03:19:40 laffer1 Exp $
#

PORTNAME=	jupp
PORTVERSION=	3.1.22
CATEGORIES=	editors
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/jupp/ \
		http://pub.allbsd.org/MirOS/dist/jupp/
DISTNAME=	joe-${PORTVERSION:C/([0-9]+\.[0-9]+)\.([0-9]+)/\1${PORTNAME}\2/}
EXTRACT_SUFX=	.tgz

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
