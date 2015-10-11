# $MidnightBSD$

PORTNAME=		pork
PORTVERSION=		0.99.8.1
PORTREVISION=		3
CATEGORIES=		net-im
MASTER_SITES=		SF/ojnk/${PORTNAME}/${PORTVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Console-based AIM client

LICENSE=		gpl2

USE_PERL5=		yes
USE_OPENSSL=		yes

GNU_CONFIGURE=		yes

post-patch:
	@${REINPLACE_CMD} -e 's/^inline //' ${WRKSRC}/src/*.h

.include <bsd.port.mk>
