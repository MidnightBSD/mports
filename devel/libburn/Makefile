# $MidnightBSD$

PORTNAME=	libburn
PORTVERSION=	0.6.8
CATEGORIES=	devel
MASTER_SITES=	http://files.libburnia-project.org/releases/
DISTFILES=	${PORTNAME}-${PORTVERSION}.pl00${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libburnia library to read/write optical discs
LICENSE=	lgpl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	LIBS="-lcam"

USE_LDCONFIG=	yes
MAN1=		cdrskin.1

.include <bsd.port.mk>
