PORTNAME=	framework-autorotate
DISTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework Laptop 12 X11 display autorotate
WWW=		https://github.com/FrauBSD/framework-autorotate

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	requires x86 inb/outb for Chrome EC LPC access

RUN_DEPENDS=	xdpyinfo:x11/xdpyinfo \
		xinput:x11/xinput \
		xrandr:x11/xrandr \
		xset:x11/xset

USES=		localbase:ldflags xorg
USE_GITHUB=	yes
GH_ACCOUNT=	FrauBSD
USE_RC_SUBR=	framework_autorotate
USE_XORG=	x11 xrandr

CFLAGS+=	-Wall -Wextra

EXAMPLESDIR=	${PREFIX}/share/examples/framework_autorotate

OPTIONS_DEFINE=		EXAMPLES
OPTIONS_DEFAULT=	EXAMPLES
OPTIONS_SUB=		yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/framework_autorotate \
		${PREFIX}/sbin
	@${MKDIR} ${PREFIX}/libexec/framework_autorotate
	${INSTALL_PROGRAM} ${WRKSRC}/xlogin_recenter \
		${PREFIX}/libexec/framework_autorotate
	${INSTALL_SCRIPT} ${WRKSRC}/libexec/map-touchscreen \
		${PREFIX}/libexec/framework_autorotate
	${INSTALL_MAN} ${WRKSRC}/framework_autorotate.8 \
		${PREFIX}/share/man/man8

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/dot.framework_autorotate.fvwm \
		${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/dot.framework_autorotate.bvwm \
		${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
