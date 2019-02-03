# $FreeBSD: ports/german/phone/Makefile,v 1.15 2005/11/10 03:48:27 linimon Exp $
# $MidnightBSD$

PORTNAME=	phone-de
PORTVERSION=	1.0
CATEGORIES=	misc german
MASTER_SITES=	http://wolfram.schneider.org/src/
DISTNAME=	avon-1996
EXTRACT_SUFX=	.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	German phone code / Deutsche Telefonvorwahl (AVON)

LICENSE=	unknown

PLIST_FILES=	share/misc/de.phone
NO_WRKSUBDIR=	YES
EXTRACT_CMD=	${GZCAT}
EXTRACT_BEFORE_ARGS=	# None
EXTRACT_AFTER_ARGS=	> ${WRKSRC}/de.phone
NO_BUILD=	YES

do-install:
	${INSTALL_DATA} ${WRKSRC}/de.phone ${PREFIX}/share/misc

.include <bsd.port.mk>
