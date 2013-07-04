# $MidnightBSD: mports/devel/libburn/Makefile,v 1.2 2010/03/01 01:41:57 laffer1 Exp $

PORTNAME=	libburn
PORTVERSION=	1.1.0
CATEGORIES=	devel
MASTER_SITES=	http://files.libburnia-project.org/releases/
DISTFILES=	${PORTNAME}-${PORTVERSION}.pl01${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libburnia library to read/write optical discs
LICENSE=	lgpl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	LIBS="-lcam" --program-prefix=""

USE_LDCONFIG=	yes
MAN1=		cdrskin.1

.include <bsd.port.mk>
