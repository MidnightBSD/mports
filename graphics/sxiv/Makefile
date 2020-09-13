# Created by: Solène RAPENNE <solene@bsd.zplay.eu>

PORTNAME=	sxiv
DISTVERSIONPREFIX=	v
DISTVERSION=	26
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight image viewer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libexif.so:graphics/libexif \
		libfontconfig.so:x11-fonts/fontconfig \
		libgif.so:graphics/giflib \
		libImlib2.so:graphics/imlib2 \
		libinotify.so:devel/libinotify

USES=		desktop-file-utils gmake localbase:ldflags pkgconfig xorg
USE_GITHUB=	yes
GH_ACCOUNT=	muennich
USE_XORG=	x11 xft

MAKE_ARGS=	PREFIX=${TRUE_PREFIX}
MAKE_ENV=	LDLIBS=-linotify

post-install:
	${SETENV} ${MAKE_ENV} DESTDIR=${FAKE_DESTDIR} ${MAKE} ${MAKE_ARGS} ${FAKE_MAKEARGS} -C ${WRKSRC}/icon install
	${INSTALL_DATA} ${WRKSRC}/sxiv.desktop ${STAGEDIR}${DESKTOPDIR}
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/sxiv

.include <bsd.port.mk>
