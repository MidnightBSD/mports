PORTNAME=	gobject-introspection
PORTVERSION=	4.3.4
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of GObject Introspection
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-glib2>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-glib2

USES=		gem gnome
USE_GNOME=	introspection

.include <bsd.port.mk>
