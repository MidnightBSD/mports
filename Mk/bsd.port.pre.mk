# $FreeBSD: ports/Mk/bsd.port.pre.mk,v 1.3 1999/08/25 04:40:21 obrien Exp $

BEFOREPORTMK=	yes

.include "bsd.port.mk"

.undef BEFOREPORTMK
