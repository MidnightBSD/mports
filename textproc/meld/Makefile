PORTNAME=	meld
PORTVERSION=	3.20.4
PORTREVISION=	2
CATEGORIES=	textproc devel python
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME visual diff and merge tool

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
RUN_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas

USES=		desktop-file-utils gettext gnome python:3.4+ shared-mime-info \
		shebangfix tar:xz
SHEBANG_FILES=	bin/meld
USE_PYTHON=	distutils noflavors
USE_GNOME=	gtksourceview3 intltool libxml2:build pygobject3
GLIB_SCHEMAS=	org.gnome.meld.gschema.xml
PYDISTUTILS_INSTALL_TARGET=	--no-update-icon-cache --no-compile-schemas install
INSTALLS_ICONS=	yes
NO_ARCH=	yes

PLIST_SUB=	PORTVER=${PORTVERSION}

.include <bsd.port.pre.mk>

PYDISTUTILS_INSTALLARGS=	-c -O1 --prefix=${TRUE_PREFIX} --root=${FAKE_DESTDIR}

.include <bsd.port.post.mk>
