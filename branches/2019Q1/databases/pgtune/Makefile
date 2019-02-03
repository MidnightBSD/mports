# $MidnightBSD$

PORTNAME=	pgtune
PORTVERSION=	0.9.3
CATEGORIES=	databases
MASTER_SITES=	http://pgfoundry.org/frs/download.php/2449/ \
		https://www.glenbarber.us/ports/${CATEGORIES}/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Postgresql.conf tuning tips based on hardware and load type

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USES=		python:2.7,run shebangfix
SHEBANG_FILES=	${PORTNAME}
NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pgtune ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/pgtune/settings
	${INSTALL_DATA} ${WRKSRC}/pg_settings* \
		${STAGEDIR}${PREFIX}/share/pgtune/settings

.include <bsd.port.mk>
