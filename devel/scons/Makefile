# $MidnightBSD$
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $

PORTNAME=	scons
PORTVERSION=	2.3.0
CATEGORIES=	devel python
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build tool alternative to make

LICENSE=	mit

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_EGGINFODIR=	${PREFIX}/lib/scons-${PORTVERSION}

PLIST_SUB+=	SCONS_VER=${PORTVERSION} \
		PYDISTUTILS_EGGINFO=${PYDISTUTILS_EGGINFO}

.include <bsd.port.pre.mk>

.if defined (NO_INSTALL_MANPAGES)
PYDISTUTILS_INSTALLARGS+=     --no-install-man
.endif

.include <bsd.port.post.mk>

