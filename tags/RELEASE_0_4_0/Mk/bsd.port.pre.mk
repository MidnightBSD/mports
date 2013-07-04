# $MidnightBSD: mports/Mk/bsd.port.pre.mk,v 1.3 2011/09/25 20:38:26 laffer1 Exp $

BEFOREPORTMK=	yes

.include "bsd.mport.mk"

.undef BEFOREPORTMK
