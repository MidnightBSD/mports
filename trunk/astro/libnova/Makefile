# ex:ts=8
#
# $MidnightBSD: ports/astro/libnova/Makefile,v 1.25 2008/12/16 05:15:39 linimon Exp $
#

PORTNAME=	libnova
PORTVERSION=	0.12.1
CATEGORIES=	astro
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Astronomical Calculation Library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnometarget lthack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
