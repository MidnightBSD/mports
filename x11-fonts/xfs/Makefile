# $MidnightBSD$

PORTNAME=	xfs
PORTVERSION=	1.0.8
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org font server
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	libfs xfont xtrans
USE_RC_SUBR=	xfs
ALL_TARGET=	all config

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
