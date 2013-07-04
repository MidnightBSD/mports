# $MidnightBSD: mports/Mk/extensions/pathfix.mk,v 1.2 2013/06/14 02:13:54 laffer1 Exp $
#
# Lookup in Makefile.in and configure for common incorrect paths and set them
# to respect BSD hier
#
.if !defined(_INCLUDE_USES_PATHFIX_MK)
_INCLUDE_USES_PATHFIX_MK=	yes

PATHFIX_MAKEFILEIN?=	Makefile.in

pre-patch: pathfix-pre-patch

pathfix-pre-patch:
	@${FIND} ${WRKSRC} -name "${PATHFIX_MAKEFILEIN}" -type f | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/locale|(prefix)/share/locale|g ; \
		s|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g ; \
		s|[{]libdir[}]/pkgconfig|(prefix)/libdata/pkgconfig|g ; \
		s|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g ; \
		s|[(]prefix[)]/lib/pkgconfig|(prefix)/libdata/pkgconfig|g ; \
		s|[$$][(]localstatedir[)]/scrollkeeper|${SCROLLKEEPER_DIR}|g ; \
			s|[(]libdir[)]/bonobo/servers|(prefix)/libdata/bonobo/servers|g' ; \
	${FIND} ${WRKSRC} -name "configure" -type f | ${XARGS} ${REINPLACE_CMD} -e \
		's|DATADIRNAME=lib|DATADIRNAME=share|g ; \
		s|{libdir}/locale|{prefix}/share/locale|g'

.endif
