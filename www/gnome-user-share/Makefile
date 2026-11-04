PORTNAME=	gnome-user-share
PORTVERSION=	48.3
PORTREVISION=	0
CATEGORIES=	www deskutils gnome
MASTER_SITES=	GNOME
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Personal file-sharing service for the GNOME Desktop
WWW=		https://gitlab.gnome.org/GNOME/gnome-user-share

LICENSE=	gpl2+

RUN_DEPENDS=	${APACHE_PKGNAMEPREFIX}mod_dnssd>=0:www/mod_dnssd \
		console-kit-daemon:sysutils/consolekit2

USES=		apache cargo gettext gnome meson pkgconfig tar:xz
USE_GNOME=	glib20
MESON_ARGS=	-Dmodules_path=${LOCALBASE}/${APACHEMODDIR} \
		-Dsystemduserunitdir=${PREFIX}/lib/systemd/user
CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no
MAKE_ENV=	${CARGO_ENV:NCARGO_BUILD_TARGET=*}

GLIB_SCHEMAS=	org.gnome.desktop.file-sharing.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e '/AuthGroupFile/s,/usr,${PREFIX},' \
		${WRKSRC}/data/dav_user_2.4.conf

post-install:
	-${RM} -r ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/systemd

.include <bsd.port.mk>
