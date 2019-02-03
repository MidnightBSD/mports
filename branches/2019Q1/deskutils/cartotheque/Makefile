# $MidnightBSD$
# $FreeBSD: head/deskutils/cartotheque/Makefile 389999 2015-06-17 22:44:31Z amdmi3 $

PORTNAME=	cartotheque
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	FREEBSD_LOCAL/dinoex
DISTNAME=	Cartotheque-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Managing notes on small cards

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Cartotheque.app/Cartotheque

.include <bsd.port.mk>
