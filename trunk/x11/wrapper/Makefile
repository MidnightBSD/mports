# $MidnightBSD: mports/x11/wrapper/Makefile,v 1.1 2009/05/08 14:13:40 laffer1 Exp $

PORTNAME=	wrapper
PORTVERSION=	1.0
CATEGORIES=	x11
DISTNAME=	# intentionally left blank
EXTRACT_SUFX=	# intentionally left blank

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper for X.org server
LICENSE=	agg

RUN_DEPENDS=	Xorg:${PORTSDIR}/x11-servers/xorg-server

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/Xwrapper
USE_XORG=	x11

.include <bsd.port.pre.mk>

XSERVER=	-DXSERVER_PATH=\"${LOCALBASE}/bin/Xorg\"
PKGNAMEPREFIX=	xorg-
COMMENT=	Wrapper for X.org X11 server

do-fetch:

do-build:
	${CC} ${CFLAGS} ${XSERVER} -o ${WRKSRC}/Xwrapper ${FILESDIR}/wrapper.c

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/Xwrapper ${PREFIX}/bin
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
