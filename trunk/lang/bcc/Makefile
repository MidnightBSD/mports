# $MidnightBSD$

PORTNAME=	bcc
PORTVERSION=	1995.03.12
PORTREVISION=	1
CATEGORIES=	lang devel
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bruce's C compiler (with as and ld); can do 16-bit code

LICENSE=	gpl2

CONFLICTS=	bin86-[0-9]* dev86-[0-9]*

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/bcc

.include <bsd.port.mk>
