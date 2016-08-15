# $MidnightBSD$

PORTNAME=	alisp
PORTVERSION=	20060917
PORTREVISION=	1
CATEGORIES=	lang devel lisp
MASTER_SITES=	http://t3x.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interpreter for purely symbolic LISP

LICENSE=	bsd2

USE_LDCONFIG=	yes
MAKE_ENV+=	BINOWN=${BINOWN} \
		BINGRP=${BINGRP} \
		PREFIX=${PREFIX}

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g' ${WRKSRC}/alisp.h

.include <bsd.port.mk>
