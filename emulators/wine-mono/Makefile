

PORTNAME=	wine-mono
DISTVERSION=	0.0.8
CATEGORIES=	emulators
MASTER_SITES=	SF/wine/Wine%20Mono/${DISTVERSION}
EXTRACT_SUFX=	.msi
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mono .NET implementation for Wine development branch (HTML support)

LICENSE=	mit gpl2 lgpl
LICENSE_COMB=	multi

NO_BUILD=	yes
PLIST_SUB+=	MONO_VERSION="${DISTVERSION}"
DATADIR=	${PREFIX}/share/wine
PLIST_FILES=	%%DATADIR%%/mono/wine-mono-%%MONO_VERSION%%.msi
PLIST_DIRSTRY=	%%DATADIR%%/mono %%DATADIR%%

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/mono
	${INSTALL_DATA} ${DISTDIR}/wine-mono-${DISTVERSION}.msi \
		${STAGEDIR}${DATADIR}/mono

.include <bsd.port.mk>
