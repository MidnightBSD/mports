# New ports collection makefile for:	scons
# Date created:				16 December 2001
# Whom:					Peter Haight <peterh@sapros.com>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $
#

PORTNAME=	scons
PORTVERSION=	0.97
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A build tool alternative to make

MAN1=		scons.1 sconsign.1 scons-time.1

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_EGGINFODIR=	${PREFIX}/lib/scons-${PORTVERSION}

PLIST_SUB=	SCONS_VER=${PORTVERSION}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 250
PLIST_SUB+=	NO_EGG="@comment "
.else
PLIST_SUB+=	NO_EGG=""
.endif

.include <bsd.port.post.mk>
