PORTNAME=	puma
PORTVERSION=	8.0.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, multithreaded and highly concurrent ruby web server
WWW=		https://puma.io/ \
		https://github.com/puma/puma

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-nio4r>=2.0<3:devel/rubygem-nio4r

USES=		cpe gem ssl

PLIST_FILES=	bin/puma bin/pumactl

.include <bsd.port.mk>
