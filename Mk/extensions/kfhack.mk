.if !defined(_INCLUDE_USES_KFHACKFIX_MK)
_INCLUDE_USES_KFHACKFIX_MK=	yes

_USES_patch+=	219:fix-kfhack
fix-kfhack:
	@cd ${WRKSRC}; \
		${FIND} -name metainfo.mk -type f \
		-exec ${SED} -i '' -e 's/FreeBSD/MidnightBSD/g' {} +

.endif
