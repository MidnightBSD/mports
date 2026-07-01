PORTNAME=	clutter
PORTVERSION=	4.3.4
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of Clutter
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	rubygem-rake>=0:devel/rubygem-rake
LIB_DEPENDS=	libclutter-1.0.so:graphics/clutter
RUN_DEPENDS=	rubygem-cairo-gobject>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-cairo-gobject \
		rubygem-gobject-introspection>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-gobject-introspection \
		rubygem-pango>=${PORTVERSION}<${PORTVERSION:R}.99:x11-toolkits/rubygem-pango

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
