# $MidnightBSD: mports/sysutils/consolekit/Makefile,v 1.5 2013/06/15 02:33:46 laffer1 Exp $

PORTNAME=	consolekit
PORTVERSION=	0.4.3
PORTREVISION=	2
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://www.freedesktop.org/software/ConsoleKit/dist/
DISTFILES=	ConsoleKit-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for defining and tracking users
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
    		polkit-gobject-1.0:${PORTSDIR}/sysutils/polkit

WRKSRC=		${WRKDIR}/ConsoleKit-${PORTVERSION}
USE_BZIP2=	yes
USE_XORG=	x11
USES=	pathfix gettext
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-pid-file=/var/run/${PORTNAME}.pid \
		--localstatedir=/var

post-install:
	${INSTALL_SCRIPT} ${FILESDIR}/ck-get-x11-display-device \
	    	${PREFIX}/libexec/ck-get-x11-display-device
	${INSTALL_SCRIPT} ${FILESDIR}/ck-get-x11-server-pid \
	    	${PREFIX}/libexec/ck-get-x11-server-pid
	${MKDIR} /var/log/ConsoleKit
	${TOUCH} /var/log/ConsoleKit/history

.include <bsd.port.mk>
