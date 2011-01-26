# $MidnightBSD: mports/net-im/pork/Makefile,v 1.3 2009/03/21 16:14:09 laffer1 Exp $

PORTNAME=		pork
PORTVERSION=		0.99.8.1
CATEGORIES=		net-im
MASTER_SITES=		SF/ojnk/${PORTNAME}/${PORTVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Console-based AIM client
LICENSE=		gpl2
USE_PERL5=		yes
USE_OPENSSL=		yes

GNU_CONFIGURE=		yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.1

MAKE_JOBS_SAFE=		yes

post-patch:
	@${REINPLACE_CMD} -e 's/^inline //' ${WRKSRC}/src/*.h

.include <bsd.port.mk>
