PORTNAME=	libsecret
PORTVERSION=	0.18.6
PORTREVISION=	1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access the secret service API

LICENSE=	lgpl2.1

BUILD_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl \
		vala:lang/vala
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig tar:xz
USE_GNOME=	glib20 libxslt:build intltool \
		introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-introspection
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
