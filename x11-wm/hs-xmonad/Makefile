PORTNAME=	xmonad
DISTVERSION=	0.18.1
CATEGORIES=	x11-wm haskell

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiling window manager
WWW=		https://xmonad.org/ \
		https://github.com/xmonad/xmonad/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	ghc:lang/ghc

USES=		cabal xorg
USE_XORG=	x11 xext xinerama xrandr xscrnsaver

PIE_UNSAFE=	yes

OPTIONS_DEFINE=	EXAMPLES

post-install:
	${INSTALL_MAN} ${WRKSRC}/man/xmonad.1 ${PREFIX}/share/man/man1/

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/man/xmonad.hs ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${FILESDIR}/example_buildscript ${FAKE_DESTDIR}${EXAMPLESDIR}/build
	${INSTALL_DATA} ${FILESDIR}/example_config.cabal ${FAKE_DESTDIR}${EXAMPLESDIR}/xmonad-config.cabal

.include <bsd.port.mk>
