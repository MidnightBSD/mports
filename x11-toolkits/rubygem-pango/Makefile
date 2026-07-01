PORTNAME=	pango
PORTVERSION=	4.3.4
CATEGORIES=	x11-toolkits rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of Pango 1.x
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-cairo-gobject>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-cairo-gobject \
		rubygem-gobject-introspection>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-gobject-introspection

USES=		gem gnome

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USE_GNOME=	cairo introspection pango

.include <bsd.port.mk>
