# New ports collection makefile for:	yawho
# Date created:		16 December 2000
# Whom:			Daniel Harris <dannyboy@FreeBSD.org>
#
# $FreeBSD: ports/sysutils/yawho/Makefile,v 1.7 2006/08/18 18:08:54 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	yawho
PORTVERSION=	1.2
CATEGORIES=	sysutils
MASTER_SITES=	http://wizard.ae.krakow.pl/~mike/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple 'w'-like program; displays connection type and login shell PID

PLIST_FILES=	bin/yawho

.include <bsd.port.pre.mk>

pre-patch:
	@${REINPLACE_CMD} -E -e 's/kp_.?proc\.._/ki_/' ${WRKSRC}/process.c

GNU_CONFIGURE=	yes

.include <bsd.port.post.mk>
