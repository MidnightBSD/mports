# $MidnightBSD$

PORTNAME=	vncreflector
PORTVERSION=	1.2.4
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SF/vnc-reflector/vnc-reflector/${PORTVERSION}
DISTNAME=	vnc_reflector-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-client VNC proxy server
LICENSE=	bsd3

LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg

USE_RC_SUBR=	vncreflector

ALL_TARGET=	default
WRKSRC=		${WRKDIR}/vnc_reflector

post-patch:
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/Makefile

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} -m0750 ${PREFIX}/etc/${PORTNAME}
	@${CHOWN} root:wheel ${PREFIX}/etc/${PORTNAME}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
