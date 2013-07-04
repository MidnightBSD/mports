# $MidnightBSD: mports/misc/pciids/Makefile,v 1.13 2013/03/30 04:05:09 laffer1 Exp $

PORTNAME=	pciids
PORTVERSION=	20130530
CATEGORIES=	misc
MASTER_SITES=	FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in PCI devices
LICENSE=	bsd3

USE_XZ=		yes
NO_BUILD=	yes
PLIST_FILES=	%%DATADIR%%/pci.ids
PLIST_DIRS=	%%DATADIR%%

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/pci.ids ${DATADIR}/

.include <bsd.port.pre.mk>

# Below only contains code to create a tar file for this beast
CT_DATE!=	date "+%Y%m%d"
CT_WRKSRC=	${WRKDIR}/tmp
CT_DESTDIR=	${PORTNAME}-${CT_DATE}
CT_TEMPDIR=	${CT_WRKSRC}/${CT_DESTDIR}
CT_MASTER_SITE=	http://pciids.sourceforge.net/v2.2/
CT_DISTFILES=	pci.ids

maketar: extract
	${MKDIR} ${CT_TEMPDIR}
.for file in ${CT_DISTFILES}
	(cd ${CT_TEMPDIR} && ${FETCH_CMD} ${CT_MASTER_SITE}/${file})
.endfor
	${DIFF} -u ${WRKSRC}/pci.ids ${CT_TEMPDIR}/pci.ids || ${TRUE}
	(cd ${CT_WRKSRC} && ${TAR} -jcf ${PORTNAME}-${CT_DATE}.tar.bz2 ${CT_DESTDIR})
	${SED} -i.bak -e 's|${PORTVERSION}|${CT_DATE}|' ${.CURDIR}/Makefile
	@(cd ${.CURDIR} && ${CP} -f ${CT_WRKSRC}/${PORTNAME}-${CT_DATE}.tar.bz2 ${DISTDIR} && \
		${MAKE} makesum)

.include <bsd.port.post.mk>
