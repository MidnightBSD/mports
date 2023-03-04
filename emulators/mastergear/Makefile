PORTNAME=	mastergear
PORTVERSION=	2.0
CATEGORIES=	emulators
MASTER_SITES=	http://fms.komkon.org/MG/
DISTNAME=	MG20-FreeBSD-80x86-bin
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SEGA Master System and Game Gear emulator for X
WWW=		https://fms.komkon.org/MG/

LICENSE=	other

LIB_DEPENDS=	libc.so.5:misc/compat5x

NO_WRKSUBDIR=	yes
ONLY_FOR_ARCHS=	i386
ONLY_FOR_ARCHS_REASON=	is an i386 binary

USES=		xorg
USE_XORG=	x11 xext

NO_BUILD=	yes
STRIP=

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mg ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/CART.ROM ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/SF7000.ROM ${DATADIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/MG.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
