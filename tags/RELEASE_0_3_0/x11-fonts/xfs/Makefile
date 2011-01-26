# $MidnightBSD: mports/x11-fonts/xfs/Makefile,v 1.3 2009/04/13 16:31:01 laffer1 Exp $

PORTNAME=	xfs
PORTVERSION=	1.1.0
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org font server
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	libfs xfont xtrans
USE_RC_SUBR=	xfs
ALL_TARGET=	all config
CONFIGURE_ENV+=	ac_cv_path_XMLTO=""

MAN1=		xfs.1

post-patch:
	${REINPLACE_CMD} '/^config_DATA/d' ${WRKSRC}/Makefile.in
.if defined(WITHOUT_XFS_CACHE)
	${REINPLACE_CMD} -e 's|^cache|XCOMM &|' ${WRKSRC}/config.cpp
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/config ${PREFIX}/etc/X11/fs/config.default
	@if [ ! -f ${PREFIX}/etc/X11/fs/config ]; then \
		${INSTALL_SCRIPT} ${WRKSRC}/config ${PREFIX}/etc/X11/fs/config; \
	fi

.include <bsd.port.mk>
