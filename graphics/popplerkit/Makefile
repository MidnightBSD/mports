# $MidnightBSD$
# $FreeBSD: ports/graphics/popplerkit/Makefile,v 1.3 2007/01/31 18:18:02 dinoex Exp $

PORTNAME=	popplerkit
PORTVERSION=	1.0.1
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/etoile/
DISTNAME=	etoile-0.4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework that supports rendering of PDF content

LICENSE=	gpl2

LIB_DEPENDS=	libpoppler.so:${PORTSDIR}/graphics/poppler

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNOME=	gnomeprefix gnomehack gtk20

WRKSRC=	${WRKDIR}/Etoile-0.4.1
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/PopplerKit

.include <bsd.port.mk>
