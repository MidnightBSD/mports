PORTNAME=	seed-fu
PORTVERSION=	2.3.9
PORTREVISION=	4
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to maintain seed data
WWW=		https://github.com/mbleigh/seed-fu

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord70>=3.1:databases/rubygem-activerecord70 \
		rubygem-activesupport70>=3.1:devel/rubygem-activesupport70

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
