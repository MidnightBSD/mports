PORTNAME=	vte4
PORTVERSION=	4.2.9
CATEGORIES=	x11-toolkits rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of VTE for GTK 4
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	rubygem-rake>=0:devel/rubygem-rake
RUN_DEPENDS=	rubygem-gtk4>=${PORTVERSION}<${PORTVERSION}_99:x11-toolkits/rubygem-gtk4

USES=		gem gnome
USE_GNOME=	vte3

NO_ARCH=	yes

.include <bsd.port.mk>
