PORTNAME=	icc-profiles-adobe-cs4
PORTVERSION=	1
CATEGORIES=	graphics
MASTER_SITES=	https://download.adobe.com/pub/adobe/iccprofiles/win/
DISTNAME=	AdobeICCProfilesCS4Win_end-user

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe ICC CMYK and RGB profiles for graphics professionals
WWW=		https://supportdownloads.adobe.com/detail.jsp?ftpID=4075

LICENSE=	ADOBEEULA.pdf
LICENSE_NAME=	Adobe End-User License Agreement
LICENSE_FILE=	${WRKDIR}/Adobe\ ICC\ Profiles\ \(end-user\)/Color\ Profile\ EULA.pdf
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

USES=		zip
NO_BUILD=	yes
NO_ARCH=	yes

SYSCOLORDIR=	share/color
PLIST_SUB=	SYSCOLORDIR=${SYSCOLORDIR}

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKDIR}/Adobe\ ICC\ Profiles\ \(end-user\) && ${COPYTREE_SHARE} \*.pdf ${DOCSDIR})
.for d in CMYK RGB
	@${MKDIR} ${PREFIX}/${SYSCOLORDIR}/Adobe/${d}
	(cd ${WRKDIR}/Adobe\ ICC\ Profiles\ \(end-user\)/${d} && ${COPYTREE_SHARE} . ${PREFIX}/${SYSCOLORDIR}/Adobe/${d})
.endfor

.include <bsd.port.mk>
