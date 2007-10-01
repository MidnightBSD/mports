# New ports collection makefile for:	ArrowLISP
# Date created:				12 Aug 2003
# Whom:					Nils M Holm <nmh@t3x.org>
#
# $MidnightBSD: mports/lang/alisp/Makefile,v 1.1 2007/05/03 08:03:26 laffer1 Exp $
# $FreeBSD: ports/lang/alisp/Makefile,v 1.19 2006/09/18 19:19:07 miwi Exp $
#

PORTNAME=	alisp
PORTVERSION=	20060917
CATEGORIES=	lang devel lisp
MASTER_SITES=	http://t3x.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interpreter for purely symbolic LISP
LICENSE=	bsd2

MAN7=		alisp.7

USE_LDCONFIG=	yes
MAKE_ENV+=	BINOWN=${BINOWN} \
		BINGRP=${BINGRP} \
		PREFIX=${PREFIX}

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g' ${WRKSRC}/alisp.h

.include <bsd.port.mk>
