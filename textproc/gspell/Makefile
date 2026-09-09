PORTNAME=	gspell
PORTVERSION=	1.14.3
CATEGORIES=	textproc
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spell checking for GTK applications
WWW=		https://gitlab.gnome.org/GNOME/gspell

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/LICENSES/LGPL-2.1-or-later.txt

LIB_DEPENDS=	libenchant-2.so:textproc/enchant2 \
		libicudata.so:devel/icu
TEST_DEPENDS=	en-hunspell>0:textproc/en-hunspell \
		Xvfb:x11-servers/xorg-server@xvfb

PORTSCOUT=	limitw:even

USES=		gettext-tools gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 gtk30 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dgtk_doc=false \
		-Dinstall_tests=false

GSPELL_TEST_DISPLAY?=	:100

do-test:
	@${LOCALBASE}/bin/Xvfb ${GSPELL_TEST_DISPLAY} -screen 0 1280x1024x24 \
		>${WRKDIR}/xvfb.log 2>&1 & \
		xvfb_pid=$$!; \
		trap 'kill $$xvfb_pid' EXIT INT TERM; \
		sleep 1; \
		cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} \
		DISPLAY=${GSPELL_TEST_DISPLAY} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${TEST_ARGS:C,^${DESTDIRNAME}=.*,,g} ${TEST_TARGET}

.include <bsd.port.mk>
