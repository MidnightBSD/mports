# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/alias.mk 371239 2014-10-20 07:33:00Z marino $
#
# Feature:      alias
# Usage:        USES=alias or USES=alias:ARGS
# Valid ARGS:   9 (default), 10, 11

.if !defined(_INCLUDE_USES_ALIAS_MK)
_INCLUDE_USES_ALIAS_MK=    yes

.if ${OPSYS} == MidnightBSD

.if empty(alias_ARGS)
CFLAGS+=	-D__FreeBSD__=9
.else
.  if ${alias_ARGS} == 10 \
   || ${alias_ARGS} == 9 || ${alias_ARGS} == 11
CFLAGS+=	-D__FreeBSD__=${alias_ARGS}
.  else
IGNORE=	invalid MAJOR RELEASE argument (${alias_ARGS}) for USES=alias
.  endif
.endif

.endif # OPSYS == MidnightBSD

.endif
