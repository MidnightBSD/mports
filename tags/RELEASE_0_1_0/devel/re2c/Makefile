# New ports collection makefile for:	re2c
# Date created:		14 May 1998
# Whom:			Eivind Eklund <eivind@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/re2c/Makefile,v 1.21 2007/06/16 19:43:13 sat Exp $
#

PORTNAME=	re2c
PORTVERSION=	0.12.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile regular expression to C (much faster final code than flex)

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GCC=	3.3+

MAN1=		re2c.1

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	${CP} -R ${WRKSRC}/doc/* ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/examples/* ${EXAMPLESDIR}
.endif
.include <bsd.port.mk>
