PORTNAME=	hyprland-protocols
DISTVERSIONPREFIX=	v
DISTVERSION=	0.7.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wayland protocol extensions for Hyprland
WWW=		https://github.com/hyprwm/hyprland-protocols

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		meson

USE_GITHUB=	yes
GH_ACCOUNT=	hyprwm

NO_ARCH=	yes

PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
