# $MidnightBSD$

PORTNAME=	freetar
PORTVERSION=	0.9
PORTREVISION=	5
CATEGORIES=	archivers gnustep
MASTER_SITES=	http://download.gna.org/freetar/
DISTNAME=	FreeTar-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TAR archiver for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/FreeTar_1_1_1_Source

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Applications/FreeTar.app/FreeTar

.include <bsd.port.mk>
