PORTNAME=	flops
PORTVERSION=	2.1
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Floating point benchmark to give your MFLOPS rating

LICENSE=	unknown

USE_GITHUB=	yes
GH_ACCOUNT=	AMDmi3

PORTDOCS=	README
PLIST_FILES=	bin/flops

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/flops ${STAGEDIR}${PREFIX}/bin/
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
