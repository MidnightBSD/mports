PORTNAME=	xdotool
DISTVERSIONPREFIX=	v
DISTVERSION=	3.20160805.1
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmatically simulate keyboard input or mouse activity

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USE_GITHUB=	yes
GH_ACCOUNT=	jordansissel

USE_LDCONFIG=	yes
USES=		gmake pkgconfig perl5 xorg
USE_XORG=	x11 xtst xinerama
USE_PERL5=	build

PLIST_FILES=	bin/xdotool include/xdo.h lib/libxdo.so \
		lib/libxdo.so.3 man/man1/xdotool.1.gz

# Older GCC on RELENG_6 doesn't like -Wno-missing-field-initializers
post-patch:
	@${REINPLACE_CMD} -e 's,-Wno-missing-field-initializers,,' \
		${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/xdotool \
		${PREFIX}/lib/libxdo.so.3

.include <bsd.port.mk>
