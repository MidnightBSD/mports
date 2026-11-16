PORTNAME=	wine-mono
DISTVERSION=	10.4.1
DISTVERSIONSUFFIX=	-x86
CATEGORIES=	emulators
MASTER_SITES=	https://dl.winehq.org/wine/wine-mono/${DISTVERSION}/
EXTRACT_SUFX=	.msi
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mono .NET implementation for Wine
WWW=		https://wiki.winehq.org/Mono

LICENSE=	mit gpl2 lgpl
LICENSE_COMB=	multi

ONLY_FOR_ARCHS=	amd64 i386

NO_BUILD=	yes
DATADIR=	${PREFIX}/share/wine
PLIST_FILES=	share/wine/mono/${DISTNAME}.msi
PLIST_DIRSTRY=	share/wine/mono share/wine

do-install:
	@${MKDIR} ${DATADIR}/mono
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}.msi ${DATADIR}/mono

.include <bsd.port.mk>
