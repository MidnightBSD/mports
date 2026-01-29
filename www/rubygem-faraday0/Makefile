PORTNAME=	faraday
PORTVERSION=	0.17.6
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/REST API client library in Ruby
WWW=		https://github.com/lostisland/faraday

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-multipart-post>=1.2<3:www/rubygem-multipart-post

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	faraday_project

PORTSCOUT=	limit:^0\.

.include <bsd.port.mk>
