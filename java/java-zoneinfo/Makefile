# $MidnightBSD$

PORTNAME=	zoneinfo
DISTVERSION=	2018i
CATEGORIES=	java misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL:S|%SUBDIR%|glewis/javazi|}
PKGNAMEPREFIX=	java-
DISTNAME=	javazi-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Updated Java timezone definitions

LICENSE=	unknown

WRKSRC=		${WRKDIR}
NO_BUILD=	yes

JAVASHAREDIR=	${PREFIX}/share/java

do-install:
	${MKDIR} ${JAVASHAREDIR}/zi
	(cd ${WRKSRC}/zi && ${COPYTREE_SHARE} \* ${JAVASHAREDIR}/zi/)

.include <bsd.port.mk>
