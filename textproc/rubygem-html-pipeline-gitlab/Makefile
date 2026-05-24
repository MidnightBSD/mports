PORTNAME=	html-pipeline
PORTVERSION=	2.14.3
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GitHub HTML processing filters and utilities
WWW=		https://github.com/jch/html-pipeline

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-activesupport-gitlab>=2:devel/rubygem-activesupport-gitlab \
		rubygem-nokogiri>=1.4:textproc/rubygem-nokogiri

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
