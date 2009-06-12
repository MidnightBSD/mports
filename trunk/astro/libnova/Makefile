# ex:ts=8
#
# $MidnightBSD: mports/astro/libnova/Makefile,v 1.1 2008/12/16 22:27:44 ctriv Exp $
#

PORTNAME=	libnova
PORTVERSION=	0.12.3
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
