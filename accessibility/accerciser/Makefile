PORTNAME=	accerciser
PORTVERSION=	3.38.0
PORTREVISION=	3
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive Python accessibility explorer for GNOME
WWW=		https://wiki.gnome.org/Apps/Accerciser

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gsettings-desktop-schemas>=3.2.0:devel/gsettings-desktop-schemas \
		itstool:textproc/itstool \
		at-spi2-core>=2.1.5:accessibility/at-spi2-core
RUN_DEPENDS=	gsettings-desktop-schemas>=3.2.0:devel/gsettings-desktop-schemas \
		at-spi2-core>=2.1.5:accessibility/at-spi2-core

NO_ARCH=	yes
USES=		gettext gmake gnome localbase:ldflags pkgconfig python shebangfix tar:xz
USE_GNOME=	gtk30 pygobject3
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
SHEBANG_FILES=	plugins/ipython_view.py

GLIB_SCHEMAS=	org.a11y.Accerciser.gschema.xml

.include <bsd.port.mk>
