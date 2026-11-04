

PORTNAME=	fhourstones
PORTVERSION=	3.1
PORTREVISION=	2
CATEGORIES=	benchmarks
MASTER_SITES=	http://tromp.github.io/c4/
DISTNAME=	Fhourstones

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrated benchmark program

LICENSE=	other

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/fhourstones \
		libexec/fhourstones/SearchGame \
		share/fhourstones/inputs

post-patch:
	@${REINPLACE_CMD} -e \
		's| = -O3| +=|' ${WRKSRC}/Makefile

post-build:
	${ECHO_CMD} '#!${SH}' > ${WRKSRC}/fhourstones
	${ECHO_CMD} 'libexecdir=${PREFIX}/libexec/fhourstones' \
		>> ${WRKSRC}/fhourstones
	${ECHO_CMD} 'datadir=${DATADIR}' >> ${WRKSRC}/fhourstones
	${ECHO_CMD} 'exec $${libexecdir}/SearchGame < $${datadir}/inputs' \
		>> ${WRKSRC}/fhourstones

do-install:
	${MKDIR} ${PREFIX}/libexec/fhourstones ${DATADIR}
	${INSTALL_SCRIPT}  ${WRKSRC}/fhourstones ${PREFIX}/bin
	${INSTALL_DATA}    ${WRKSRC}/inputs ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/SearchGame \
		${PREFIX}/libexec/fhourstones

.include <bsd.port.mk>
