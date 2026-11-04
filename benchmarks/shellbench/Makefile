PORTNAME=	shellbench
PORTVERSION=	20200806
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Benchmark utility for POSIX shell comparison

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	shellspec
GH_TAGNAME=	ce43ba49d3

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
		${REINPLACE_CMD} 's:%%DATADIR%%:${TRUE_PREFIX}/${DATADIR_REL}:g' ${WRKSRC}/shellbench
		${REINPLACE_CMD} 's:%%DOCSDIR%%:${TRUE_PREFIX}/${DOCSDIR_REL}:g' ${WRKSRC}/shellbench
		${INSTALL_SCRIPT} ${WRKSRC}/shellbench ${PREFIX}/bin
		${MKDIR} ${DATADIR}
		${INSTALL_DATA} ${WRKSRC}/sample/* ${DATADIR}/
		${MKDIR} ${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/README.md ${DOCSDIR}/

.include <bsd.port.mk>
