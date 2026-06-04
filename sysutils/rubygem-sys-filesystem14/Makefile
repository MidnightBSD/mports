PORTNAME=	sys-filesystem
PORTVERSION=	1.4.5
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	14

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface for getting filesystem information
WWW=		https://github.com/djberg96/sys-filesystem

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	rubygem-ffi>=1.1<2:devel/rubygem-ffi
RUN_DEPENDS=	rubygem-ffi>=1.1<2:devel/rubygem-ffi

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^1\.4\.

.include <bsd.port.mk>
