PORTNAME=	mime-types
PORTVERSION=	3.7.0
CATEGORIES=	misc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby gem which provides a mailcap-like MIME Content-Type lookup
WWW=		https://github.com/mime-types/ruby-mime-types

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENCE.md

RUN_DEPENDS=	rubygem-logger>=0:devel/rubygem-logger \
		rubygem-mime-types-data>=3.2025.0507<4:misc/rubygem-mime-types-data

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
