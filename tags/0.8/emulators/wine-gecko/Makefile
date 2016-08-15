# $MidnightBSD$

PORTNAME=	wine-gecko
DISTVERSION=	2.21
CATEGORIES=	emulators
MASTER_SITES=	SF/wine/Wine%20Gecko/${DISTVERSION}
DISTNAME=	wine_gecko-${DISTVERSION}-x86
EXTRACT_SUFX=	.msi
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gecko Layout Engine for Wine (HTML support)

LICENSE=	mpl gpl2 gpl3 lgpl2.1 lgpl3
LICENSE_COMB=	multi

NO_BUILD=	yes
PLIST_SUB+=	GECKO_VERSION="${DISTVERSION}"
DATADIR=	${PREFIX}/share/wine
PLIST_FILES=	%%DATADIR%%/gecko/wine_gecko-%%GECKO_VERSION%%-x86.msi
PLIST_DIRSTRY=	%%DATADIR%%/gecko %%DATADIR%%

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/gecko
	${INSTALL_DATA} ${DISTDIR}/wine_gecko-${DISTVERSION}-x86.msi \
		${STAGEDIR}${DATADIR}/gecko

.include <bsd.port.mk>
