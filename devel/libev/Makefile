# $MidnightBSD: mports/devel/libev/Makefile,v 1.1 2009/12/13 21:03:53 laffer1 Exp $

PORTNAME=	libev
PORTVERSION=	3.9
CATEGORIES=	devel
MASTER_SITES=	http://dist.schmorp.de/libev/ \
		http://dist.schmorp.de/libev/Attic/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured and high-performance event loop library
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

MAN3=		ev.3

post-patch:
	@${REINPLACE_CMD} -e 's/if EV_MINIMAL/if defined(EV_MINIMAL) \&\& EV_MINIMAL/g' \
		${WRKSRC}/ev.h \
		${WRKSRC}/ev.c \
		${WRKSRC}/ev++.h

.include <bsd.port.mk>
