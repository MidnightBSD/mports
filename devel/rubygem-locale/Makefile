PORTNAME=	locale
PORTVERSION=	2.1.5
PORTREVISION=	0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure ruby library to support locales
WWW=		https://ruby-gettext.github.io/ \
		https://github.com/ruby-gettext/locale

LICENSE=	lgpl3+ ruby
LICENSE_COMB=	dual
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fiddle>0:devel/rubygem-fiddle

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
