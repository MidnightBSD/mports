PORTNAME=	flipper
PORTVERSION=	1.3.6
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Act of enabling/disabling features in your application
WWW=		https://github.com/jnunemaker/flipper

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-concurrent-ruby<2:devel/rubygem-concurrent-ruby

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/flipper

.include <bsd.port.mk>
