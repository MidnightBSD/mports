PORTNAME=	ruby-saml
PORTVERSION=	1.18.1
CATEGORIES=	security rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SAML toolkit for Ruby on Rails
WWW=		https://developers.onelogin.com/saml/ruby \
		https://github.com/SAML-Toolkits/ruby-saml

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-nokogiri>=1.13.10:textproc/rubygem-nokogiri \
		rubygem-rexml>=0:textproc/rubygem-rexml

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
