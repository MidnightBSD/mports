# $MidnightBSD: mports/net/zniper/Makefile,v 1.1 2008/02/27 02:09:56 laffer1 Exp $

PORTNAME=	zniper
PORTVERSION=	1.0
CATEGORIES=	net
MASTER_SITES=	CENKES
# Unversioned distfile available from:
# http://www.signedness.org/tools/zniper.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display and reset active TCP connections
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${PORTNAME}
MAKE_ARGS=	CFLAGS="${CFLAGS}" CC="${CC}"
ALL_TARGET=	fbsd_x86
PLIST_FILES=	bin/${PORTNAME}
MAN1=	${PORTNAME}.1

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MAN1PREFIX}/man/man1/

.include <bsd.port.mk>
