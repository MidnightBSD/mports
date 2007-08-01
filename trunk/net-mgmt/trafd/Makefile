# New ports collection makefile for:	trafd
# Date created:		22 January 2000
# Whom:			Michael Vasilenko <acid@stu.cn.ua>
#
# $FreeBSD: ports/net-mgmt/trafd/Makefile,v 1.14 2006/05/11 22:49:44 edwin Exp $
# $MidnightBSD: mports/net-mgmt/trafd/Makefile,v 1.2 2007/06/06 21:11:33 ctriv Exp $
#

PORTNAME=	trafd
PORTVERSION=	3.0.1
PORTREVISION=	2
CATEGORIES=	net-mgmt
MASTER_SITES=	ftp://ftp.riss-telecom.ru/pub/dev/trafd/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The BPF Traffic Collector
LICENSE=	bsd3

CONFLICTS=	bpft-4.*

.include <bsd.port.pre.mk>

RCSUBRBASE=	/etc

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
	${CP} ${FILESDIR}/trafd.sh.sample ${WRKDIR}
	${REINPLACE_CMD} -e "s|%%RC_SUBR%%|${RCSUBRBASE}/rc.subr|g;" \
	    ${WRKDIR}/trafd.sh.sample
	${INSTALL_SCRIPT} ${WRKDIR}/trafd.sh.sample ${PREFIX}/etc/rc.d
	@${MKDIR} ${PREFIX}/var/trafd
	@${MKDIR} ${PREFIX}/var/log
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
