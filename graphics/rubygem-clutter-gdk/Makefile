PORTNAME=	clutter-gdk
PORTVERSION=	4.2.9
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of GDK-specific API of Clutter
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

RUN_DEPENDS=	rubygem-clutter>=${PORTVERSION}<${PORTVERSION}_99:graphics/rubygem-clutter \
		rubygem-gdk3>=${PORTVERSION}<${PORTVERSION}_99:x11-toolkits/rubygem-gdk3

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
