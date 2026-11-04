PORTNAME=	gcr
PORTVERSION=	3.41.2
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for bits of crypto UI and parsing
WWW=		https://live.gnome.org/GnomeKeyring

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING

BUILD_DEPENDS=	gpg2:security/gnupg
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libp11-kit.so:security/p11-kit \
		libgcrypt.so:security/libgcrypt \
		libsecret-1.so:security/libsecret
RUN_DEPENDS=	gpg2:security/gnupg

CONFLICTS=	gnome-keyring-2.[0-9]*
PORTSCOUT=	limit:^3\.

USES=		desktop-file-utils gettext-tools gnome meson \
		pkgconfig python shared-mime-info tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 introspection:build
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}
INSTALL_TARGET=	install-strip
MESON_ARGS=	-Dsystemd=disabled \
		-Dgtk_doc=false \
		-Dssh_agent=false

GLIB_SCHEMAS=	org.gnome.crypto.pgp.gschema.xml

NO_TEST=	yes

.include <bsd.port.mk>
