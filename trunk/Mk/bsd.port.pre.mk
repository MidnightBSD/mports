# $MidnightBSD: mports/Mk/bsd.port.pre.mk,v 1.2 2006/09/17 18:32:20 laffer1 Exp $

BEFOREPORTMK=	yes

.include "bsd.port.mk"

.undef BEFOREPORTMK
