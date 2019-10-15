PORTNAME=	menumaker
PORTVERSION=	0.99.11
CATEGORIES=	deskutils
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Menu generator for X Window Managers and desktop environments

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake python

GNU_CONFIGURE=	yes
NO_ARCH=	yes

LDFLAGS+=	-L${LOCALBASE}/lib

INFO=		mmaker

.include <bsd.port.mk>
