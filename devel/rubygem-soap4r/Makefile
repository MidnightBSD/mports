PORTNAME=	soap4r
PORTVERSION=	1.5.8
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SOAP 1.1 library for web services
WWW=		https://github.com/felipec/soap4r

LICENSE=	gpl2+ ruby
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-httpclient>=2.1.1:www/rubygem-httpclient

NO_ARCH=	yes
USES=		gem

PLIST_FILES=	bin/wsdl2ruby.rb bin/xsd2ruby.rb

.include <bsd.port.mk>
