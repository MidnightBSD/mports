# Created by: Greg Lewis <glewis@FreeBSD.org>

PORTNAME=	zoneinfo
DISTVERSION=	2019b
CATEGORIES=	java misc
MASTER_SITES=	FREEBSD_LOCAL/glewis/javazi
PKGNAMEPREFIX=	java-
DISTNAME=	javazi-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Updated Java timezone definitions

LICENSE=	publicdom

WRKSRC=		${WRKDIR}
NO_BUILD=	yes

JAVASHAREDIR=	${PREFIX}/share/java

do-install:
	${MKDIR} ${STAGEDIR}${JAVASHAREDIR}/zi
	(cd ${WRKSRC}/zi && ${COPYTREE_SHARE} . ${STAGEDIR}${JAVASHAREDIR}/zi)

.include <bsd.port.mk>
