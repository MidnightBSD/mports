PORTNAME=	gnome-pomodoro
PORTVERSION=	0.28.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	deskutils gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time management utility for GNOME
WWW=		https://gnomepomodoro.org

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib
LIB_DEPENDS=	libcanberra.so:audio/libcanberra \
		libgom-1.0.so:databases/gom \
		libpeas-1.0.so:devel/libpeas1

USES=		desktop-file-utils display:test gettext-tools gmake gnome \
		gstreamer libtool meson pkgconfig sqlite vala:build

USE_GITHUB=	yes
WRKSRC=		${WRKDIR}/FocusTimer-${PORTVERSION}

USE_GNOME=	cairo glib20 gtk30 introspection

GLIB_SCHEMAS=	org.gnome.pomodoro.gschema.xml \
		org.gnome.pomodoro.plugins.actions.gschema.xml \
		org.gnome.pomodoro.plugins.gnome.gschema.xml \
		org.gnome.pomodoro.plugins.sounds.gschema.xml
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

PORTDOCS=	NEWS README.md

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

do-test:
	@cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} \
		DISPLAY=:${XVFBPORT} ${NINJA_CMD} ${TEST_TARGET}

.include <bsd.port.mk>
