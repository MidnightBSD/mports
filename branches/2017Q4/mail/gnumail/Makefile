# $MidnightBSD$

PORTNAME=	gnumail
PORTVERSION=	1.2.2
PORTREVISION=	1
CATEGORIES=	mail gnustep
MASTER_SITES=	http://download.gna.org/gnustep-nonfsf/
DISTNAME=	GNUMail-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep mail client

LICENSE=	gpl2

USES=		cpe gnustep
CPE_VENDOR=	gnu
USE_GNUSTEP=	back build
LIB_DEPENDS=	libPantomime.so:${PORTSDIR}/mail/pantomime \
		libAddresses.so:${PORTSDIR}/mail/addresses
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

.include <bsd.port.mk>
