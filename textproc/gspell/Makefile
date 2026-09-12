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

PORTSCOUT=	limitw:1,even

USES=		gettext-tools gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 gtk30 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dgtk_doc=false \
		-Dinstall_tests=false

do-test:
	@port=100; while test -S /tmp/.X11-unix/X$${port}; do \
			port=$$((port + 1)); \
		done; \
		display=:$${port}; socket=/tmp/.X11-unix/X$${port}; \
		${LOCALBASE}/bin/Xvfb $${display} -screen 0 1280x1024x24 \
		>${WRKDIR}/xvfb.log 2>&1 & \
		xvfb_pid=$$!; \
		for i in 1 2 3 4 5; do \
			if kill -0 $$xvfb_pid 2>/dev/null && test -S $${socket}; then \
				break; \
			fi; \
			sleep 1; \
		done; \
		if ! kill -0 $$xvfb_pid 2>/dev/null || ! test -S $${socket}; then \
			${CAT} ${WRKDIR}/xvfb.log; \
			exit 1; \
		fi; \
		trap 'kill $$xvfb_pid 2>/dev/null || :' EXIT INT TERM; \
		cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} \
		DISPLAY=$${display} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${TEST_ARGS:C,^${DESTDIRNAME}=.*,,g} ${TEST_TARGET}

.include <bsd.port.mk>
