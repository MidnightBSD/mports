PORTNAME=	gdk_pixbuf2
PORTVERSION=	4.3.4
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of GdkPixbuf 2.x
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	rubygem-pkg-config>=1.3.5:devel/rubygem-pkg-config \
		rubygem-rake>=0:devel/rubygem-rake
RUN_DEPENDS=	rubygem-gio2>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-gio2

USES=		gem gnome
USE_GNOME=	gdkpixbuf

NO_ARCH=	yes

.include <bsd.port.mk>
