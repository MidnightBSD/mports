# New ports collection makefile for:	jupp
# Date created:		May 20 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/joe/Makefile,v 1.6 2008/04/25 23:50:42 ctriv Exp $
#

PORTNAME=	jupp
PORTVERSION=	3.1
PORTREVISION=	0
CATEGORIES=	editors
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/jupp/ \
		http://pub.allbsd.org/MirOS/dist/jupp/
DISTFILES=	joe-3.1jupp9.cpio.gz
MAINTAINER=	ports@MidnightBSD.org
COMMENT=	jupp - the editor which sucks less
LICENSE=	gpl

CONFLICTS=      joe-2.* joe-3*

WRKSRC=		${WRKDIR}/${PORTNAME}

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell

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
