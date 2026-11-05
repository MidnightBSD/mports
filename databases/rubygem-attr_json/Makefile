PORTNAME=	attr_json
PORTVERSION=	2.5.0
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serialized json-hash-backed ActiveRecord attributes
WWW=		https://github.com/jrochkind/attr_json

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		gem

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord80>=8.0.5.2<8.1:databases/rubygem-activerecord80

NO_ARCH=	yes

.include <bsd.port.mk>
