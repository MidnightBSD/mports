# $MidnightBSD$
# $FreeBSD: ports/devel/glib20-reference/Makefile,v 1.2 2006/05/31 22:18:43 mezz Exp $
#

PORTREVISION=	1

BOOKS=		glib gobject gio

glib_MAN=	glib-gettextize.1
gobject_MAN=	glib-genmarshal.1 glib-mkenums.1 gobject-query.1

do-install:
.for d in ${BOOKS}
	if [ -d ${REFERENCE_SRC}/${d}/html ]; then \
        	${MKDIR} ${STAGEDIR}${PREFIX}/share/doc/${d}; \
		cd ${REFERENCE_SRC}/${d}/html && \
		${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/share/doc/${d}; \
	fi
.endfor

post-install:
.for m in glib gobject
	${INSTALL_MAN} ${${m}_MAN:S|^|${REFERENCE_SRC}/${m}/|} \
		${STAGEDIR}${PREFIX}/man/man1
.endfor

add-plist-docs:
	@${DO_NADA}

.include "${.CURDIR}/../../devel/glib20-reference/bsd.gnome-reference.mk"
