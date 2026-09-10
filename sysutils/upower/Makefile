PORTNAME=	upower
PORTVERSION=	1.91.2
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils
MASTER_SITES=	https://gitlab.freedesktop.org/upower/upower/-/archive/${DISTVERSIONFULL}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus daemon for simplifying power management tasks
WWW=		https://upower.freedesktop.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpolkit-gobject-1.so:sysutils/polkit

USES=		compiler:c11 gettext gnome localbase meson \
		pkgconfig
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes
MESON_ARGS=	-Dgtk-doc=false \
		-Dinstalled_tests=false \
		-Dos_backend=freebsd \
		-Dudevrulesdir=no \
		-Dudevhwdbdir=no \
		-Dsystemdsystemunitdir=no \
		-Didevice=disabled \
		-Dpolkit=enabled \
		-Dzshcompletiondir=no
LDFLAGS+=	-lkvm

OPTIONS_DEFINE=			DOCS MANPAGES
OPTIONS_DEFAULT=		MANPAGES
OPTIONS_SUB=			yes
MANPAGES_BUILD_DEPENDS=		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:textproc/docbook-xsl \
				docbook-sgml>0:textproc/docbook-sgml \
				docbook-xml>0:textproc/docbook-xml \
				gtkdoc-scan:textproc/gtk-doc
MANPAGES_USE=			GNOME=libxslt:build
MANPAGES_MESON_TRUE=		man

post-install:
	@${MKDIR} ${PREFIX}/etc/UPower/UPower.conf.d

.include <bsd.port.mk>
