PORTNAME=	droid-fonts-ttf
PORTVERSION=	20131024
PORTREVISION=	2
CATEGORIES=	x11-fonts
MASTER_SITES=	FREEBSD_LOCAL/sunpoet/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Droid typeface family

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${LOCALBASE}/bin/mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale

USES=		tar:xz

FONTDIR=	lib/X11/fonts/Droid
PKGMESSAGE=	${WRKDIR}/pkg-message
PLIST_SUB=	FONTDIR=${FONTDIR}
SUB_FILES=	pkg-message
SUB_LIST=	FONTDIR=${FONTDIR}

do-build:
	@cd ${WRKSRC}/ && ${LOCALBASE}/bin/mkfontscale
	@cd ${WRKSRC}/ && ${LOCALBASE}/bin/mkfontdir

do-install:
	${MKDIR} ${PREFIX}/${FONTDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} *.ttf fonts.* ${PREFIX}/${FONTDIR}/

# maintainer section:
# https://android.googlesource.com/platform/frameworks/base/+/master/data/fonts/

MS_DISTFILES=	fonts.tar.gz
MS_FONTS=	${WRKSRC}/.ms-fonts
MS_MASTER_SITE=	https://android.googlesource.com/platform/frameworks/base/+archive/master/data/
MS_PLIST=	${WRKSRC}/.ms-pkg-plist
MS_VERSION?=	${PORTVERSION}
MS_WRKSRC=	${WRKSRC}/tmp

maketar: do-clean extract
	${MKDIR} ${MS_WRKSRC}/ ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}/
	${FETCH_CMD} -o ${MS_WRKSRC}/${MS_DISTFILES} ${MS_MASTER_SITE}${MS_DISTFILES}
	${TAR} -x -C ${MS_WRKSRC}/ -f ${MS_WRKSRC}/${MS_DISTFILES}
	${LS} ${MS_WRKSRC}/Droid*.ttf | ${SED} 's|${MS_WRKSRC}/||' > ${MS_FONTS}
	${MV} ${MS_WRKSRC}/Droid*.ttf ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}/
	${TAR} -Jc -C ${MS_WRKSRC}/ -f ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}.tar.xz ${PORTNAME}-${MS_VERSION}/
	sudo ${INSTALL} -m 644 ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}.tar.xz ${DISTDIR}/
	${SED} -i '' -e 's|${PORTVERSION}|${MS_VERSION}|' ${.CURDIR}/Makefile
	cd ${.CURDIR}/ && ${MAKE} makesum
	${ECHO_MSG} '*** Update from ${PORTVERSION} to ${MS_VERSION} ***'
# genplist
	${SED} 's|^|%%FONTDIR%%/|' ${MS_FONTS} > ${MS_PLIST}
	${ECHO_CMD} "%%FONTDIR%%/fonts.dir" >> ${MS_PLIST}
	${ECHO_CMD} "%%FONTDIR%%/fonts.scale" >> ${MS_PLIST}
	${ECHO_CMD} "@dirrm %%FONTDIR%%" >> ${MS_PLIST}
	${INSTALL} -m 600 ${MS_PLIST} ${PLIST}

.include <bsd.port.mk>
