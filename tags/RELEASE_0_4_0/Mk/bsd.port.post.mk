# $MidnightBSD: mports/Mk/bsd.port.post.mk,v 1.3 2011/09/25 20:38:26 laffer1 Exp $

AFTERPORTMK=	yes

.include "bsd.mport.mk"

.undef AFTERPORTMK
