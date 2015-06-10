# $MidnightBSD$
#
# Lookup in Makefile.in to prevent a package from installing/modifying charset.alias
#
.if !defined(_INCLUDE_USES_CHARSETFIX_MK)
_INCLUDE_USES_CHARSETFIX_MK=	yes

.if !empty(charsetfix_ARGS)
IGNORE=	USES=charsetfix does not require args
.endif

CHARSETFIX_MAKEFILEIN?=	Makefile.in

post-patch: charsetfix-post-patch

charsetfix-post-patch:
	@${FIND} ${WRKSRC} -name "${CHARSETFIX_MAKEFILEIN}" -type f | ${XARGS} ${REINPLACE_CMD} \
		-e 's|need_charset_alias=true|need_charset_alias=false|g ; \
		s|test -f $$(charset_alias)|false|g ;\
		s|test -f $$(DESTDIR)$$(libdir)/charset.alias|false|g'

.endif
