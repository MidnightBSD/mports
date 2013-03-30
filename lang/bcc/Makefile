# $MidnightBSD: mports/lang/bcc/Makefile,v 1.3 2009/08/20 18:49:19 laffer1 Exp $

PORTNAME=	bcc
PORTVERSION=	1995.03.12
CATEGORIES=	lang devel
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bruce's C compiler (with as and ld); can do 16-bit code
LICENSE=	gpl2

CONFLICTS=	bin86-[0-9]* dev86-[0-9]*

MAKE_JOBS_SAFE=  yes
MAN1=		as86.1 bcc.1 bcc-cc1.1 ld86.1
.if !defined(NO_MANCOMPRESS)
MANCOMPRESSED=	yes
.endif

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/bcc

.include <bsd.port.mk>
