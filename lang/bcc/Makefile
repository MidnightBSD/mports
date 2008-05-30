# New ports collection makefile for:	bcc
# Date created:		29 May 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	bcc
PORTVERSION=	1995.03.12
CATEGORIES=	devel lang
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bruce's C compiler (with as and ld); can do 16-bit code
LICENSE=	gpl2

CONFLICTS=	bin86-[0-9]* dev86-[0-9]*
MAN1=		as86.1 bcc.1 bcc-cc1.1 ld86.1
.if !defined(NOMANCOMPRESS)
MANCOMPRESSED=	yes
.endif

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/bcc

.include <bsd.port.mk>
