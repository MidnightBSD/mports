PORTNAME=	gtk2
PORTVERSION=	3.4.3
PORTREVISION=	2
CATEGORIES=	x11-toolkits rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of GTK 2
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

RUN_DEPENDS=	rubygem-atk>=${PORTVERSION}:accessibility/rubygem-atk \
		rubygem-gdk_pixbuf2>=${PORTVERSION}:graphics/rubygem-gdk_pixbuf2 \
		rubygem-pango>=${PORTVERSION}:x11-toolkits/rubygem-pango

USES=		gem gnome
USE_GNOME=	gtk20 introspection

CONFIGURE_ARGS=	--with-cflags=-Wno-incompatible-function-pointer-types

.include <bsd.port.mk>
