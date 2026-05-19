# Created by: Wen heping <wenheping@gmail.com>

PORTNAME=	weberp
PORTVERSION=	4.15.2
CATEGORIES=	finance www
MASTER_SITES=	SF/web-erp/
DISTNAME=	webERP_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-Source Web-Based ERP System

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/doc/LICENSE.txt

PORTSCOUT=	skipv:3.12

USES=		gettext php shebangfix zip
SHEBANG_FILES=	report_runner.php
USE_PHP=	mysqli gettext
WRKSRC=		${WRKDIR}/webERP

NO_BUILD=	yes
SUB_FILES=	pkg-message
PLIST=		${WRKDIR}/plist
ERPDIR=		www/weberp

pre-install:
	@${ECHO_CMD} -e '@owner ${WWWOWN}\n@group ${WWWGRP}' > ${PLIST}
	@${FIND} -s -d ${WRKSRC} -type f | ${SED} "s?${WRKSRC}?${ERPDIR}?g" >> ${PLIST}
	@${FIND} -s -d ${WRKSRC} -type d  | ${SED} "s?${WRKSRC}?@dir ${ERPDIR}?g" >> ${PLIST}
	@${ECHO_CMD} -e '@owner root\n@group wheel' >> ${PLIST}

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR}
	@${CHMOD} -R 755 ${WWWDIR}

.include <bsd.port.mk>
