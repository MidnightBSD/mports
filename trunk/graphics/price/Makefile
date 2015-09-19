# $MidnightBSD$

PORTNAME=	price
PORTVERSION=	1.3.0
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTVERSION}
DISTNAME=	PRICE-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image filtering and manipulation using GNUstep

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gnustep

USE_GNUSTEP=	back build

DATADIR=	${GNUSTEP_LOCAL_ROOT}/Applications/PRICE.app
PORTDATA=	*
PLIST_FILES=	${GNUSTEP_LOCAL_TOOLS}/PRICE \
		share/applications/PRICE.desktop

post-build:
	${SED} -i '' -e '/^Categories/s/=/&Graphics;/' \
		${WRKSRC}/PRICE.app/Resources/PRICE.desktop

post-install:
	${STRIP_CMD} ${DATADIR}/PRICE
	${LN} -sf ${DATADIR}/Resources/PRICE.desktop \
		${PREFIX}/share/applications

.include <bsd.port.mk>
