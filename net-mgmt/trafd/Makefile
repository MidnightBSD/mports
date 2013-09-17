# $MidnightBSD$

PORTNAME=	trafd
PORTVERSION=	3.0.2.1
CATEGORIES=	net-mgmt
MASTER_SITES=	ftp://ftp.riss-telecom.ru/pub/dev/trafd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The BPF Traffic Collector

LICENSE=	bsd3

USE_RC_SUBR=	trafd

CONFLICTS=	bpft-4.*

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/trafd/trafd ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/trafd/trafstart ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/trafd/trafstop ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/trafd/trafsave ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/trafd/trafdump ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/trafstat/trafstat ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/trafstatd/trafstatd ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/traflog/traflog ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/traflog/traflog.format ${PREFIX}/etc
	@${MKDIR} ${PREFIX}/var/trafd
	@${MKDIR} ${PREFIX}/var/log
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
