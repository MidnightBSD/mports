PORTNAME=	rails-html-sanitizer
PORTVERSION=	1.6.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sanitize HTML fragments in Rails applications
WWW=		https://github.com/rails/rails-html-sanitizer

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-loofah-gitlab>=2.21<3:textproc/rubygem-loofah-gitlab \
		rubygem-nokogiri>=1.15.7<2:textproc/rubygem-nokogiri

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	rubyonrails
CPE_PRODUCT=	html_sanitizer

.include <bsd.port.mk>
