PORTNAME=	cairo
PORTVERSION=	1.17.14
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding for GLib2
WWW=		https://rcairo.github.io/ \
		https://github.com/rcairo/rcairo

LICENSE=	gpl2+ ruby
LICENSE_COMB=	dual

RUN_DEPENDS=	rubygem-native-package-installer>=1.0.3:devel/rubygem-native-package-installer \
		rubygem-pkg-config>=1.2.2:devel/rubygem-pkg-config \
		rubygem-red-colors>=0:graphics/rubygem-red-colors

USES=		gem gnome pkgconfig
USE_GNOME=	cairo

.include <bsd.port.mk>
