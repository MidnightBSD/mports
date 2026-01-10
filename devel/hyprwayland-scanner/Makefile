PORTNAME=	hyprwayland-scanner
DISTVERSIONPREFIX=	v
DISTVERSION=	0.4.5
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hyprland implementation of wayland-scanner
WWW=		https://github.com/hyprwm/hyprwayland-scanner

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libpugixml.so:textproc/pugixml

USES=		cmake compiler:c++11-lib pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	hyprwm

PLIST_FILES=	bin/${PORTNAME} \
		lib/cmake/${PORTNAME}/${PORTNAME}-config-version.cmake \
		lib/cmake/${PORTNAME}/${PORTNAME}-config.cmake \
		libdata/pkgconfig/${PORTNAME}.pc

PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIRDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIRDIR}${DOCSDIR}

.include <bsd.port.mk>
