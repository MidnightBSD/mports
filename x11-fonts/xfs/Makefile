PORTNAME=	xfs
PORTVERSION=	1.2.2
PORTEPOCH=	1
CATEGORIES=	x11-fonts
DISTFILES=	xfs-1.2.2.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org font server

LICENSE=	mit

USES=		cpe gmake xorg xorg-cat:app tar:xz
CPE_VENDOR=	x.org
CPE_PRODUCT=	x_font_server
USE_XORG=	libfs xfont2 xorgproto xtrans
USE_RC_SUBR=	xfs
CONFIGURE_ARGS=	--without-xmlto --without-fop

post-patch:
	${REINPLACE_CMD} '/^config_DATA/d' ${WRKSRC}/config/Makefile.in
.if defined(WITHOUT_XFS_CACHE)
	${REINPLACE_CMD} -e 's|^cache|XCOMM &|' ${WRKSRC}/config.cpp
.endif

post-build:
	@cd ${WRKSRC}/config/ && ${MAKE_CMD} config

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11/fs
	${INSTALL_SCRIPT} ${WRKSRC}/config/config \
		${STAGEDIR}${PREFIX}/etc/X11/fs/config.sample

.include <bsd.port.mk>
