# $MidnightBSD$
# $FreeBSD: ports/deskutils/vnc2flv/Makefile,v 1.2 2011/12/20 17:10:17 jgh Exp $

PORTNAME=	vnc2flv
PORTVERSION=	20100207
PORTREVISION=	1
CATEGORIES=	deskutils multimedia www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Captures a VNC desktop session and saves as a flv

LICENSE=	mit

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USES=		python
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	X11
X11_RUN_DEPENDS=x11vnc:${PORTSDIR}/net/x11vnc

post-install:
	${STRIP_CMD} ${PYTHONPREFIX_SITELIBDIR}/flvscreen.so

.include <bsd.port.mk>
