PORTNAME=	bootsnap
PORTVERSION=	1.23.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Boot large ruby/rails apps faster
WWW=		https://github.com/rails/bootsnap

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-msgpack>=1.2<2:devel/rubygem-msgpack

USES=		gem

PLIST_FILES=	bin/bootsnap

.include <bsd.port.mk>
