PORTNAME=	dbf
PORTVERSION=	4.3.2
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for reading dBase, xBase, Clipper and FoxPro database files
WWW=		https://github.com/infused/dbf

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gem

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-csv>=0:devel/rubygem-csv

NO_ARCH=	yes

PORTSCOUT=	limit:^4\.

post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/dbf

.include <bsd.port.mk>
