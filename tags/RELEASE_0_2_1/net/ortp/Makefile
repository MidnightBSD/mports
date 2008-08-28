# New ports collection makefile for:	ortp
# Date created:				20 October 2003
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net/ortp/Makefile,v 1.13 2007/03/25 16:47:00 pav Exp $
#

PORTNAME=	ortp
PORTVERSION=	0.13.0
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	linphone/ortp/sources

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Real-time Transport Protocol (RTP) stack
LICENSE=	lgpl

USE_GNOME=	glib20 pkgconfig gnomehack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
USE_LDCONFIG=	yes

pre-install:
.if defined(NOPORTDOCS)
	${RM} -rf ${WRKSRC}/docs/html
.endif

.include <bsd.port.mk>
