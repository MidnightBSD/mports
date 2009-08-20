# $MidnightBSD: mports/lang/alisp/Makefile,v 1.2 2007/05/24 16:51:38 ctriv Exp $

PORTNAME=	alisp
PORTVERSION=	20060917
CATEGORIES=	lang devel lisp
MASTER_SITES=	http://t3x.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interpreter for purely symbolic LISP
LICENSE=	bsd2

MAKE_JOBS_SAFE=  yes

MAN7=		alisp.7

USE_LDCONFIG=	yes
MAKE_ENV+=	BINOWN=${BINOWN} \
		BINGRP=${BINGRP} \
		PREFIX=${PREFIX}

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g' ${WRKSRC}/alisp.h

.include <bsd.port.mk>
