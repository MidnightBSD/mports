PORTNAME=	pghero
PORTVERSION=	3.7.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance dashboard for Postgres
WWW=		https://github.com/ankane/pghero

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord71>=7.1:databases/rubygem-activerecord71

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	pghero_project

.include <bsd.port.mk>
