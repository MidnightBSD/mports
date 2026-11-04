PORTNAME=	sanitize
PORTVERSION=	6.0.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	60

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Whitelist based HTML sanitizer
WWW=		https://github.com/rgrove/sanitize

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-crass>=1.0.2<1.1:www/rubygem-crass \
		rubygem-nokogiri>=1.12.0:textproc/rubygem-nokogiri
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	sanitize_project

PORTSCOUT=	limit:^6\.0\.

.include <bsd.port.mk>
