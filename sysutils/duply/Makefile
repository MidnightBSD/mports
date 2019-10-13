PORTNAME=	duply
PORTVERSION=	2.1
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://duply.net/projects/ftplicity/files/latest/download/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shell front end for the duplicity backup tool

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/gpl-2.0.txt

RUN_DEPENDS=	duplicity:sysutils/duplicity@${PY_FLAVOR} \
		bash:shells/bash

USES=		python:2.7 tar:tgz

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/duply ${PERIODICDIR}/${PERIODICFILE}
PERIODICFILE?=	300.duply
PERIODICDIR?=	${PREFIX}/etc/periodic/backup
SUB_FILES=	pkg-message periodic_duply

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e "s,/etc/duply,${ETCDIR},g" ${WRKSRC}/duply

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/duply ${STAGEDIR}${PREFIX}/bin/duply
	@${MKDIR} ${STAGEDIR}${PERIODICDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/periodic_duply ${STAGEDIR}${PERIODICDIR}/${PERIODICFILE}

.include <bsd.port.mk>
