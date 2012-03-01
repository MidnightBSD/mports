# $MidnightBSD$
# $FreeBSD: ports/devel/yajl/Makefile,v 1.7 2011/11/27 19:36:58 crees Exp $

PORTNAME=	yajl
PORTVERSION=	2.0.1
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/bapt \
		http://files.etoilebsd.net/yajl/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Portable JSON parsing and serialization library in ANSI C
LICENSE=	bsd2

GITREF=		f4b2b1a
DISTNAME=	lloyd-${PORTNAME}-${PORTVERSION}-g${GITREF}
WRKSRC=		${WRKDIR}/lloyd-${PORTNAME}-${GITREF}
PLIST_SUB=	VERSION=${PORTVERSION}

USE_LDCONFIG=	yes
USE_CMAKE=	yes

.include <bsd.port.mk>
