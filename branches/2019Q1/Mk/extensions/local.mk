# -*- mode: Makefile; tab-width: 4; -*-
# ex: ts=4
#
# bsd.local.mk - Sandbox for local modification to ports framework.
#
# Created by: Mark Linimon <linimon@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/Mk/bsd.local.mk,v 1.1 2006/01/21 17:37:01 krion Exp $
#

.if !defined(_POSTMKINCLUDED) && !defined(Local_Pre_Include)

Local_Pre_Include=		local.mk

#
# here is where any code that needs to run at bsd.port.pre.mk inclusion
# time should live.
#

.endif # !defined(_POSTMKINCLUDED) && !defined(Local_Pre_Include)

.if defined(_POSTMKINCLUDED) && !defined(Local_Post_Include)

Local_Post_Include=	local.mk

#
# here is where any code that needs to run at bsd.port.post.mk inclusion
# time should live.
#

.endif # defined(_POSTMKINCLUDED) && !defined(Local_Post_Include)
