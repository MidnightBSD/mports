PORTNAME=	loofah
PORTVERSION=	2.24.1
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating HTML/XML documents and fragments
WWW=		https://github.com/flavorjones/loofah

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE.txt

RUN_DEPENDS=	rubygem-crass>=1.0.2<1.1:www/rubygem-crass \
		rubygem-nokogiri>=1.12.0:textproc/rubygem-nokogiri

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	loofah_project

.include <bsd.port.mk>
