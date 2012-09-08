# $MidnightBSD: mports/dns/mdnsd/Makefile,v 1.5 2009/06/07 19:18:17 laffer1 Exp $

PORTNAME=	mdnsd
PORTVERSION=	0.7G
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.cs.cmu.edu/~dpelleg/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advertise a service via Rendezvous
LICENSE=	bsd4
# he says it's bsd without being too specific.. let's worst case this

do-install:
.for i in mhttp mquery
	@${INSTALL} ${COPY} ${_BINOWNGRP} ${WRKSRC}/${i} ${PREFIX}/bin
.endfor

.include <bsd.port.mk>
