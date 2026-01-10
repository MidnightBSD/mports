PORTNAME=	xdg-terminal-exec
DISTVERSIONPREFIX=v
DISTVERSION=	0.14.1
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line interface to launch graphical terminal applications
WWW=		https://gitlab.freedesktop.org/terminal-wg/specifications/-/merge_requests/3

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	ginstall:sysutils/coreutils

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	Vladimir-csp

MAKE_ARGS=	prefix=${FAKE_DESTDIR}${TRUE_PREFIX}

BINARY_ALIAS=	install=ginstall
OPTIONS_SUB=	yes
NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	MANPAGES

MANPAGES_BUILD_DEPENDS=	scdoc:textproc/scdoc

post-patch-MANPAGES-off:
	${REINPLACE_CMD} -e 's/scdoc/echo/g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
