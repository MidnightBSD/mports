

PORTNAME=	qqwing
PORTVERSION=	1.3.4
DISTVERSIONPREFIX=	v
PORTREVISION=	3
CATEGORIES=	games gnome
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sudoku generating and solving software

LICENSE=	gpl2

USES=		autoreconf compiler:c++11-lang gmake libtool pathfix pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	stephenostermiller

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_OUTSOURCE=	yes
AUTORECONF_WRKSRC=	${WRKSRC}/build
CONFIGURE_CMD=	${AUTORECONF_WRKSRC}/configure
INSTALL_TARGET=	install-strip

pre-build:
	@${LN} -sf ${WRKSRC}/doc/qqwing.man ${BUILD_WRKSRC}/qqwing.1
	@${LN} -sf ${WRKSRC}/src/cpp/*.[ch]pp ${BUILD_WRKSRC}/

.include <bsd.port.mk>
