# New ports collection makefile for:	glitz
# Date created:		2004-10-06
# Whom:			Michael Johnson <ahze@ahze.net>
#
# $MidnightBSD: mports/graphics/glitz/Makefile,v 1.3 2007/04/27 18:56:15 ctriv Exp $
# $FreeBSD: ports/graphics/glitz/Makefile,v 1.10 2006/05/07 23:46:04 edwin Exp $
#   $MCom: ports/graphics/glitz/Makefile,v 1.4 2005/08/09 22:54:54 ahze Exp $
#

PORTNAME=	glitz
PORTVERSION=	0.5.6
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL image compositing library

USE_GL=		yes
USE_GNOME=	pkgconfig gnometarget gnomehack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_ENV=	CPPFLAGS="${PTHREAD_CFLAGS}" \
		LDFLAGS="${PTHREAD_LIBS}"

.include <bsd.port.mk>

