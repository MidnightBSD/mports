PORTNAME=	CFPropertyList
PORTVERSION=	4.0.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Read, write and manipulate both binary and XML property lists
WWW=		https://github.com/ckruse/CFPropertyList

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-base64>=0:converters/rubygem-base64 \
		rubygem-nkf>=0:net/rubygem-nkf \
		rubygem-rexml>=0:textproc/rubygem-rexml

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
