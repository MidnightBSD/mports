PORTNAME=	wine-gecko
DISTVERSION=	2.47.4
CATEGORIES=	emulators
MASTER_SITES=	https://dl.winehq.org/wine/wine-gecko/${DISTVERSION}/
EXTRACT_SUFX=	.msi
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gecko Layout Engine for Wine (HTML support)
WWW=		https://wiki.winehq.org/Gecko

LICENSE=	MPL20 gpl2 gpl3 lgpl2.1 lgpl3
LICENSE_COMB=	multi

ONLY_FOR_ARCHS=	amd64 i386

NO_BUILD=	yes
PLIST_SUB+=	GECKO_VERSION="${DISTVERSION}"
DATADIR=	${PREFIX}/share/wine

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
DISTVERSIONSUFFIX=	-x86
.else
DISTVERSIONSUFFIX=	-x86_64
.endif

PLIST_FILES=	share/wine/gecko/${DISTNAME}.msi
PLIST_DIRSTRY=	share/wine/gecko share/wine

do-install:
	@${MKDIR} ${DATADIR}/gecko
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}.msi ${DATADIR}/gecko

.include <bsd.port.post.mk>
