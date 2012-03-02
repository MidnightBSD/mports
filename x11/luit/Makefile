# $MidnightBSD: mports/x11/luit/Makefile,v 1.3 2011/05/07 00:40:37 laffer1 Exp $

PORTNAME=	luit
PORTVERSION=	1.1.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locale and ISO 2022 support for Unicode terminals
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 fontenc

CFLAGS+=	-DBSD
CONFIGURE_ARGS=	--datadir=${LOCALBASE}/lib

PLIST_FILES=	bin/luit

MAN1=		luit.1

.if !defined(WITH_SETUID_LUIT)
pre-everything::
	@${ECHO_MSG} "If you want to use xterm with locales in a secure manner, luit must be"
	@${ECHO_MSG} "installed setuid.  If you want to do this, define WITH_SETUID_LUIT when"
	@${ECHO_MSG} "installing this port (either in /etc/make.conf or on command line with"
	@${ECHO_MSG} "install target)."
.endif

post-install:
.if defined(WITH_SETUID_LUIT)
	${CHOWN} root:wheel ${PREFIX}/bin/luit
	${CHMOD} 04711 ${PREFIX}/bin/luit
.endif

.include <bsd.port.mk>
