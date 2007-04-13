# New ports collection makefile for:	m4
# Date created:		25 October 1994
# Whom:			mr
#
# $MidnightBSD: mports/devel/m4/Makefile,v 1.1 2006/09/19 21:45:17 wintellect Exp $
# $FreeBSD: ports/devel/m4/Makefile,v 1.28 2005/12/04 23:35:13 edwin Exp $
#

PORTNAME=	m4
PORTVERSION=	1.4.4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	m4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU m4

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

.if defined(WITH_CHANGEWORD)
CONFIGURE_ARGS+=	--enable-changeword
.endif

INFO=	m4

EXAMPLESDIR=	share/examples/gm4

post-install:
	@${MKDIR} ${PREFIX}/${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.m4 ${PREFIX}/${EXAMPLESDIR}

.include <bsd.port.mk>
