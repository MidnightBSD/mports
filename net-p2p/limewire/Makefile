# $MidnightBSD: mports/net-p2p/limewire/Makefile,v 1.12 2009/08/21 18:08:33 laffer1 Exp $

PORTNAME=	limewire
PORTVERSION=	5.3.6
PORTEPOCH=	1
CATEGORIES=	net-p2p java
MASTER_SITES=	http://www10.limewire.com/download/
DISTNAME=	LimeWireOther

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Java based Gnutella client
LICENSE=	gpl2

RUN_DEPENDS=	java:${PORTSDIR}/java/javavmwrapper

USE_ZIP=	yes
USE_JAVA=	yes
JAVA_RUN=	jre
JAVA_VERSION=	1.4+
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/LimeWire

DATADIR=	${JAVASHAREDIR}/${PORTNAME}

SUB_FILES=	${PORTNAME}.sh

post-extract:
	@cd ${WRKSRC} && \
		${RM} -f *.exe *.dll *.so *.sh cygwin.* COPYING SOURCE && \
		${MV} README.txt ..

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
	${MKDIR} ${DATADIR}
	${CP} -R ${WRKSRC}/* ${DATADIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/README.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
