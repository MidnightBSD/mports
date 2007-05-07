# New ports collection makefile for:	v4l_compat
# Date created:				Aug 1 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/v4l_compat/Makefile,v 1.2 2007/01/22 12:06:18 flz Exp $
#

PORTNAME=	v4l_compat
PORTVERSION=	1.0.${DUMMYDATE}
CATEGORIES=	multimedia
MASTER_SITES=	# none
DISTFILES=	# none
DUMMYDATE=	20060801

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux compatibility header

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/include/linux/
	${INSTALL_DATA} ${FILESDIR}/videodev.h ${PREFIX}/include/linux/

.include <bsd.port.mk>
