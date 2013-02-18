# $MidnightBSD: mports/sysutils/libutempter/Makefile,v 1.1 2009/03/13 03:10:37 laffer1 Exp $

PORTNAME=	libutempter
PORTVERSION=	1.1.5
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.altlinux.org/pub/people/ldv/utempter/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to record user sessions to utmp and wtmp files
LICENSE=	lgpl

FAKE_MAKEARGS+= DESTDIR=${FAKE_DESTDIR}${TRUE_PREFIX}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
IGNORE=		is now contained in the base system
.endif

.include <bsd.port.post.mk>
