PORTNAME=	qstat
PORTVERSION=	2.17
DISTVERSIONPREFIX=	v
CATEGORIES=	games net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line program to query game servers on the net
WWW=		https://github.com/multiplay/qstat

LICENSE=	artistic2

CONFLICTS_INSTALL=	torque

USES=		autoreconf gmake
GNU_CONFIGURE=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	multiplay

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-extract:
	@${MV} ${WRKSRC}/qstat.cfg ${WRKSRC}/qstat.cfg.sample

post-patch:
	@${REINPLACE_CMD} -e 's|qstat\.cfg|&.sample|' ${WRKSRC}/Makefile.am
	@${REINPLACE_CMD} -e 's|__hpux|${OPSYS}|' ${WRKSRC}/qstat.c
	@${PRINTF} '#!/bin/sh\n\necho -n ${PORTVERSION}' > \
		${WRKSRC}/scripts/version.sh

do-install-DOCS-on:
	@${MKDIR} ${DOCSDIR}/info ${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/CHANGES.txt ${WRKSRC}/qstatdoc.html \
		${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/template/*.html ${WRKSRC}/template/*.txt \
		${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/info/*.txt ${DOCSDIR}/info

.include <bsd.port.mk>
