PORTNAME=	ethon
PORTVERSION=	0.18.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very lightweight libcurl wrapper
WWW=		https://github.com/typhoeus/ethon

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcurl.so:ftp/curl
RUN_DEPENDS=	rubygem-ffi>=1.15.0:devel/rubygem-ffi \
		rubygem-logger>=0:devel/rubygem-logger

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
