# $MidnightBSD: mports/devel/scons/Makefile,v 1.5 2011/03/11 22:24:11 laffer1 Exp $
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $

PORTNAME=	scons
PORTVERSION=	2.0.1
PORTREVISION=	0
CATEGORIES=	devel python
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	pgollucci@FreeBSD.org
COMMENT=	A build tool alternative to make
LICENSE=	mit

MAKE_JOBS_SAFE=	yes

.if !defined (NO_INSTALL_MANPAGES)
MAN1=		scons.1 sconsign.1 scons-time.1
.endif

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_EGGINFODIR=	${PREFIX}/lib/scons-${PORTVERSION}

PLIST_SUB+=	SCONS_VER=${PORTVERSION}

.include <bsd.port.pre.mk>

.if defined (NO_INSTALL_MANPAGES)
PYDISTUTILS_INSTALLARGS+=     --no-install-man
.endif

.include <bsd.port.post.mk>

