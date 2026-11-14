PORTNAME=	midnight-battle-zone
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.0
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cat-themed 3D Vulkan real-time strategy game
WWW=		https://github.com/MidnightBSD/midnight-battle-zone

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	vulkan-loader>0:graphics/vulkan-loader

USES=		cargo xorg
USE_GITHUB=	yes
GH_ACCOUNT=	MidnightBSD
USE_XORG=	x11

SUB_FILES=	${PORTNAME}

# The game reads assets/ relative to the working directory, so the
# binary goes in libexec and a wrapper in bin starts it from DATADIR.
# Upstream does not commit Cargo.lock; ship the one used to vendor
# CARGO_CRATES.
post-extract:
	${CP} ${FILESDIR}/Cargo.lock ${WRKSRC}

post-install:
	${MV} ${PREFIX}/bin/${PORTNAME} ${PREFIX}/libexec/${PORTNAME}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${PREFIX}/bin
	cd ${WRKSRC} && ${COPYTREE_SHARE} assets ${DATADIR}

.include <bsd.port.mk>
