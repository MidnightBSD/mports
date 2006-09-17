# $FreeBSD: ports/Mk/bsd.port.post.mk,v 1.3 1999/08/25 04:40:21 obrien Exp $

AFTERPORTMK=	yes

.include "bsd.port.mk"

.undef AFTERPORTMK
