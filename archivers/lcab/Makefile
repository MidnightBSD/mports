# New ports collection makefile for:	LCAB
# Date created:				27 May 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/lcab/Makefile,v 1.2 2006/10/17 10:07:04 danfe Exp $
#

PORTNAME=	lcab
PORTVERSION=	1.0b12
CATEGORIES=	archivers
MASTER_SITES=	DEBIAN
DISTFILES=	${PORTNAME}_${PORTVERSION}.orig${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft .CABinet file creator

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"
PLIST_FILES=	bin/lcab man/man1/${PORTNAME}.1.gz

pre-build:
	@${REINPLACE_CMD} -e 's|1.0b11|1.0b12|' ${WRKSRC}/mytypes.h
	@${REINPLACE_CMD} -e 's|1.0b8|1.0b12|' \
		-e '/http:\/\/www.geekshop.be\/rien\/lcab\//d' \
		${WRKSRC}/${PORTNAME}.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}/${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
