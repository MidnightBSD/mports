PORTNAME=	oj
PORTVERSION=	3.16.16
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast JSON parser and serializer
WWW=		https://www.ohler.com/oj/ \
		https://github.com/ohler55/oj

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-bigdecimal-gitlab>=3.0:math/rubygem-bigdecimal-gitlab \
		rubygem-ostruct>=0.2:devel/rubygem-ostruct

USES=		gem

# TODO: find a better way to do this
# Install all header files, some of them are required by devel/rubygem-oj-introspect
post-install:
	${MKDIR} ${PREFIX}/${GEM_LIB_DIR}/ext/oj
	${INSTALL_DATA} ${WRKSRC}/ext/oj/*.h ${PREFIX}/${GEM_LIB_DIR}/ext/oj/

.include <bsd.port.mk>
