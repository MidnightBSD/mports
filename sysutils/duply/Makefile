PORTNAME=	duply
DISTVERSION=	2.5.3
CATEGORIES=	sysutils
MASTER_SITES=	SOURCEFORGE/ftplicity/duply%20%28simple%20duplicity%29/2.5.x/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shell front end for the duplicity backup tool
WWW=		https://duply.net

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/gpl-2.0.txt

RUN_DEPENDS=	duplicity:sysutils/duplicity \
		bash:shells/bash

USES=		python tar:tgz

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/duply ${PERIODICDIR}/${PERIODICFILE}
PERIODICFILE?=	300.duply
PERIODICDIR?=	${PREFIX}/etc/periodic/backup
SUB_FILES=	pkg-message periodic_duply

post-patch:
	${REINPLACE_CMD} -e "s,/etc/duply,${ETCDIR},g" ${WRKSRC}/duply

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/duply ${STAGEDIR}${PREFIX}/bin/duply
	@${MKDIR} ${STAGEDIR}${PERIODICDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/periodic_duply ${STAGEDIR}${PERIODICDIR}/${PERIODICFILE}

.include <bsd.port.mk>
