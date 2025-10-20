.if !defined(_INCLUDE_USES_KFHACKFIX_MK)
_INCLUDE_USES_KFHACKFIX_MK=	yes

_USES_patch+=	219:fix-kfhack
fix-kfhack:
	${FIND} ${WRKSRC} -name metainfo.yaml -type f \
		-exec ${REINPLACE_CMD} -i '' -e 's/FreeBSD/MidnightBSD/g' {} +
	${FIND} ${WRKSRC} -name metainfo.mk -type f \
		-exec ${REINPLACE_CMD} -i '' -e 's/FreeBSD/MidnightBSD/g' {} +

.endif
