PORTNAME=	google-protobuf
PORTVERSION=	4.33.2
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby extension to Google Protocol Buffers
WWW=		https://protobuf.dev/ \
		https://github.com/protocolbuffers/protobuf \
		https://github.com/protocolbuffers/protobuf/tree/main/ruby

LICENSE=	bsd3

BUILD_DEPENDS=	rubygem-rake>=13:devel/rubygem-rake
RUN_DEPENDS=	rubygem-bigdecimal>=0:math/rubygem-bigdecimal \
		rubygem-rake>=13:devel/rubygem-rake

USES=		gem shebangfix
USES+=	cpe
CPE_VENDOR=	google
CPE_PRODUCT=	protobuf

SHEBANG_GLOB=	*.rb

.include <bsd.port.mk>
