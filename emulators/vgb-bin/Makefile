PORTNAME=	vgb
PORTVERSION=	3.0
PORTEPOCH=	1
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	http://fms.komkon.org/VGB/
PKGNAMESUFFIX=	-bin
DISTNAME=	VGB${PORTVERSION:S/.//}-FreeBSD-80x86-bin
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nintendo GameBoy(tm) emulator (closed binary version of vgb)
WWW=		https://fms.komkon.org/VGB/

LICENSE=	other

ONLY_FOR_ARCHS=	i386
ONLY_FOR_ARCHS_REASON=	required i386 dependencies

LIB_DEPENDS=	libc.so.5:misc/compat5x

IA32_BINARY_PORT=	yes
NO_BUILD=	no
NO_WRKSUBDIR=	no
USES=		xorg
USE_XORG=	x11 xext

PLIST_FILES=	bin/vgb
PORTDATA=	CART.GB
PORTDOCS=	VGB.html

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vgb ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/CART.GB ${DATADIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/VGB.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
