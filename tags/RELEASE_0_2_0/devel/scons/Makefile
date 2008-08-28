# New ports collection makefile for:	scons
# Date created:				16 December 2001
# Whom:					Peter Haight <peterh@sapros.com>
#
# $MidnightBSD: mports/devel/scons/Makefile,v 1.1 2007/12/03 05:32:59 laffer1 Exp $
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $
#

PORTNAME=	scons
PORTVERSION=	0.98.5
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A build tool alternative to make
LICENSE=	mit

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
