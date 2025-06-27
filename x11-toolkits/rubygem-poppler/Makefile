PORTNAME=	poppler
PORTVERSION=	4.2.9
CATEGORIES=	x11-toolkits rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of poppler-glib
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	rubygem-rake>=0:devel/rubygem-rake
LIB_DEPENDS=	libpoppler-glib.so:graphics/poppler-glib
RUN_DEPENDS=	rubygem-cairo-gobject>=${PORTVERSION}<${PORTVERSION}_99:devel/rubygem-cairo-gobject \
		rubygem-gio2>=${PORTVERSION}<${PORTVERSION}_99:devel/rubygem-gio2

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
