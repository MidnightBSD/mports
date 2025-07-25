PORTNAME=	gnome-tweaks
PORTVERSION=	40.10
PORTREVISION=	2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows to tweak some hidden settings in GNOME3
WWW=		https://gitlab.gnome.org/GNOME/gnome-tweaks

LICENSE=	CC0-1.0 gpl3+
LICENSE_COMB=	multi
LICENSE_FILE_CC0-1.0=	${WRKSRC}/LICENSES/CC0-1.0
LICENSE_FILE_gpl3+ =	${WRKSRC}/LICENSES/GPL-3.0

BUILD_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas
LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy
RUN_DEPENDS=	gnome-shell>=3.28:x11/gnome-shell \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas

USES=		gettext gnome localbase meson pkgconfig python shebangfix \
		tar:xz
USE_GNOME=	gtk30 nautilus3 pygobject3
GLIB_SCHEMAS=	org.gnome.tweaks.gschema.xml
SHEBANG_FILES=	gnome-tweak-tool-lid-inhibitor gnome-tweaks \
		meson-postinstall.py
BINARY_ALIAS=	python3=${PYTHON_VERSION}

NO_ARCH=	yes
PORTSCOUT=	limitw:1,even

# generates .py[co] files for installed modules
# if that's not done, ${PYTHON_SITELIBDIR}/gps will be polluted
# with these files when module is imported from root user
post-install:
#	${FIND} ${PREFIX} -name \*.pyc -delete

#	${PYTHON_CMD:S,${FAKE_DESTDIR},,} ${PYTHON_LIBDIR}/compileall.py \
#		-f -d ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/gtweak \
#		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/gtweak


.include <bsd.port.mk>
