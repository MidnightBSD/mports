PORTNAME=	hiredis
PORTVERSION=	0.6.3
PORTREVISION=	4
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby wrapper for hiredis
WWW=		https://github.com/redis/hiredis-rb

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	redis>=0:databases/redis

USES=		gem gmake

.include <bsd.port.mk>
