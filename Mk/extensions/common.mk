.if !defined(_INCLUDE_USES_COMMON_MK)

_INCLUDE_USES_COMMON_MK=        yes

.if ${OSVERSION} >= 300000
CFLAGS+=	-fcommon
LDFLAGS+=	-Wl,--allow-multiple-definition
.endif

.endif
