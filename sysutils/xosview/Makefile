PORTNAME=	xosview
DISTVERSION=	1.23
PORTREVISION=	2
CATEGORIES=	sysutils

MAINTAINER=	kazuok@midnightbsd.org
COMMENT=	Graphical performance meter
WWW=		https://www.pogo.org.uk/~mark/xosview/

LICENSE=	bsd4 gpl2
LICENSE_COMB=	multi

FAKE_OPTS=	trueprefix

RUN_DEPENDS=	font-misc-misc>=1.1.2:x11-fonts/font-misc-misc

USES=		gmake xorg
USE_GITHUB=	yes
GH_ACCOUNT=	hills

USE_XORG=	x11 xpm
MAKE_ENV=	OPTFLAGS="" PLATFORM=bsd MANDIR=${PREFIX}/share/man
ALL_TARGET=	xosview

DESKTOP_ENTRIES="XOsview" "" "" "xosview" "" ""

do-configure:
	@${SED} -e '/CXX/s|^|#|' -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/targets/freebsd > ${WRKSRC}/.config

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}
	@${CP} ${WRKSRC}/Xdefaults ${PREFIX}/lib/X11/app-defaults/XOsview

.include <bsd.port.mk>
