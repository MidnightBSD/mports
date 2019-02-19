# $MidnightBSD$
# $FreeBSD: ports/devel/glib20-reference/Makefile,v 1.2 2006/05/31 22:18:43 mezz Exp $
#

PORTREVISION=	3

BOOKS=		glib gobject gio

do-install:
.for d in ${BOOKS}
	if [ -d ${REFERENCE_SRC}/${d}/html ]; then \
        	${MKDIR} ${STAGEDIR}${PREFIX}/share/doc/${d}; \
		cd ${REFERENCE_SRC}/${d}/html && \
		${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/share/doc/${d}; \
	fi
.endfor

add-plist-docs:
	@${DO_NADA}

.include "${.CURDIR}/../../devel/glib20-reference/bsd.gnome-reference.mk"
