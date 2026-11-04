PORTNAME=	rails-dom-testing
PORTVERSION=	2.3.0
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails80

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analyse and compare DOMs using Nokogiri
WWW=		https://github.com/rails/rails-dom-testing

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-activesupport80>=5.0.0:devel/rubygem-activesupport80 \
		rubygem-minitest>=0:devel/rubygem-minitest \
		rubygem-nokogiri>=1.6:textproc/rubygem-nokogiri
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
