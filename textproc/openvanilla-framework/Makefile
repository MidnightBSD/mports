PORTNAME=	openvanilla-framework
PORTVERSION=	0.7.2.20070514
CATEGORIES=	textproc
MASTER_SITES=	FREEBSD_LOCAL/rafan
DISTNAME=	openvanilla-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development header files for OpenVanilla
WWW=		https://openvanilla.org/

LICENSE=	bsd3

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/include/OpenVanilla
	${INSTALL_DATA} ${WRKSRC}/Framework/Headers/* \
		${PREFIX}/include/OpenVanilla

.include <bsd.port.mk>
