# $MidnightBSD$

PORTNAME=	pidgin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pidgin multi-protocol messaging client (GTK+ UI)

LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification \
		libpurple.so:net-im/libpurple

MASTERDIR=	${.CURDIR}/../libpurple
BUILD_WRKSRC=	${WRKSRC}/pidgin
INSTALL_WRKSRC=	${BUILD_WRKSRC}
INSTALLS_ICONS=	yes
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

PIDGIN_SLAVE=	yes
WITH_GTKUI=	yes

USES=		python:build
USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix gtk20 intltool
USE_XORG=	xscrnsaver sm
CONFIGURE_ARGS=	--disable-consoleui \
		--disable-nm \
		--enable-screensaver \
		--with-dynamic_prpls=${PRPL_MODULES:S/,$//}

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/pidgin.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include "${MASTERDIR}/Makefile"
