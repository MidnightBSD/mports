# $MidnightBSD$

PORTNAME=	wine
PORTVERSION=	1.6.2
PORTREVISION=	5
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	FREEBSD_LOCAL/dbn/repos/wine/${DIST_SUBDIR}/${PORTVERSION}
PKGNAMEPREFIX=	i386-
DISTNAME=	${PKGNAME}
EXTRACT_SUFX=	.txz
DIST_SUBDIR=	freebsd:9:x86:64

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	32bit Microsoft Windows compatibility environment for 64bit BSD

LICENSE=        lgpl2.1 lgpl3
LICENSE_COMB=   dual
LICENSE_FILE=   ${WRKDIR}/LICENSE

OPTIONS_DEFINE=	GECKO MONO
GECKO_DESC=     Bundle Gecko MSI package for Wine
MONO_DESC=      Bundle Mono MSI package for Wine

CONFLICTS_INSTALL=	i386-wine-devel-[0-9]* wine-[0-9]* wine-devel-[0-9]*

EXTRACT_AFTER_ARGS=	-C / --exclude +COMPACT_MANIFEST --exclude +MANIFEST \
				--exclude +MTREE_DIRS --exclude share/licenses/'*' \
				--exclude libdata/ldconfig32/${UNIQUENAME} \
				-s '|/usr/local|${STAGEDIR}${PREFIX}|gs'
NO_BUILD=	yes
ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	wine only runs on x86 architecture
PKGINSTALL=	${.CURDIR}/files/pkg-install
PKGDEINSTALL=	${PKGINSTALL}
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message
USE_LDCONFIG32=	${PREFIX}/lib32 ${PREFIX}/lib32/wine
USES=		tar:xz

GECKO_RUN_DEPENDS=   ${DATADIR}/gecko/wine_gecko-2.21-x86.msi:${PORTSDIR}/emulators/wine-gecko
MONO_RUN_DEPENDS=   ${DATADIR}/mono/wine-mono-0.0.8.msi:${PORTSDIR}/emulators/wine-mono

EXTRACT_DEPENDS+=	/usr/local/bin/bsdtar:${PORTSDIR}/archivers/libarchive
EXTRACT_CMD=	/usr/local/bin/bsdtar

PORTSCOUT=	limitw:1,even

# Included for OPSYS and OSVERSION
.include <bsd.port.pre.mk>

do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/${EXTRACT_ONLY} -C ${WRKDIR} --include '/usr/local/share/licenses/${PKGNAME}/LICENSE' -s '|/usr/local/share/licenses/${PKGNAME}/||g'

do-install:
	${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/${EXTRACT_ONLY} ${EXTRACT_AFTER_ARGS}

${PLIST}: fetch
	${TAR} -tf ${_DISTDIR}/${EXTRACT_ONLY} ${EXTRACT_AFTER_ARGS} | ${GREP} -v '/$$' | ${SED} 's|/usr/local/||g' | sort > ${PLIST}
	${TAR} -tf ${_DISTDIR}/${EXTRACT_ONLY} ${EXTRACT_AFTER_ARGS} | ${GREP} '/$$' | ${SED} -e 's|/usr/local/\(.*\)/$$|@dirrm \1|g' -e 's|/$$||g' -e 's|@dirrm man|@dirrmtry man|g' | sort -r >> ${PLIST}

port-update:
	${RM} -f ${.CURDIR}/distinfo ${.CURDIR}/distinfo~ ${.CURDIR}/pkg-plist.*
	${MAKE} fetch OSREL=9
	${MAKE} makesum OSREL=9
	${CAT} ${.CURDIR}/distinfo >> ${.CURDIR}/distinfo~
	${RM} ${.CURDIR}/distinfo
	${MAKE} pkg-plist.9 PLIST=pkg-plist.9 OSREL=9
	${MV} ${.CURDIR}/distinfo~ ${.CURDIR}/distinfo
	python ${FILESDIR}/mergeplist.py ${.CURDIR}/pkg-plist.* > ${PLIST}
	${RM} ${.CURDIR}/pkg-plist.*

.include <bsd.port.post.mk>
