PORTNAME=	hyprwire
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and consistent wire protocol for IPC
WWW=		https://github.com/hyprwm/hyprwire

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libhyprutils.so:devel/hyprutils \
		libffi.so:devel/libffi \
		libpugixml.so:textproc/pugixml

USES=		cmake:testing compiler:c++11-lib pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	hyprwm

LDFLAGS+=	-pthread

PLIST_SUB=	SOVERSION_FULL=${DISTVERSION} \
		SOVERSION_MAJOR=2
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

# XXX Drop after MidnightBSD 4.x EOL
# https://cgit.freebsd.org/src/commit/?id=af93fea71038
.if !exists(/usr/include/sys/timerfd.h)
LIB_DEPENDS+=	libepoll-shim.so:devel/libepoll-shim
.endif

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
