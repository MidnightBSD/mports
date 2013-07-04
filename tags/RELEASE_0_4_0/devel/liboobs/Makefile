# $MidnightBSD: mports/devel/liboobs/Makefile,v 1.4 2011/01/17 15:22:54 laffer1 Exp $
# $FreeBSD: ports/devel/liboobs/Makefile,v 1.6 2008/06/06 13:21:28 edwin Exp $


PORTNAME=	liboobs
PORTVERSION=	2.32.0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	portsMidnightBSD.org
COMMENT=	Wrapping library to the System Tools Backends
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/etc/dbus-1/system.d/org.freedesktop.SystemToolsBackends.conf:${PORTSDIR}/sysutils/system-tools-backends
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
    		hal.1:${PORTSDIR}/sysutils/hal
RUN_DEPENDS=	${LOCALBASE}/etc/dbus-1/system.d/org.freedesktop.SystemToolsBackends.conf:${PORTSDIR}/sysutils/system-tools-backends

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc --with-hal
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include"

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|utmpx|utmp|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
