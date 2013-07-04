# $MidnightBSD$
# $FreeBSD: ports/deskutils/vnc2flv/Makefile,v 1.2 2011/12/20 17:10:17 jgh Exp $

PORTNAME=	vnc2flv
PORTVERSION=	20100207
CATEGORIES=	deskutils multimedia www python
MASTER_SITES=	${MASTER_SITE_CHEESESHOP}
MASTER_SITE_SUBDIR=	source/v/${PORTNAME}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Captures a VNC desktop session and saves as a flv
LICENSE=	mit

.if !defined(WITHOUT_X11)
RUN_DEPENDS+=	x11vnc:${PORTSDIR}/net/x11vnc
.endif

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGNAME=	${PORTNAME}
PYDISTUTILS_PKGVERSION=	${PORTVERSION}

.include <bsd.port.mk>
