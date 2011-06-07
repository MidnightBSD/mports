# $MidnightBSD$
# $FreeBSD: ports/devel/gir-repository/Makefile,v 1.5 2010/11/20 16:06:47 kwm Exp $

MASTER_SITES=	# Empty
DISTFILES=	# None
PATCHDIR=	# None

CATEGORIES=	devel gnome

COMMENT=	Introspection information for various libraries
LICENSE=	agg

NO_BUILD=	yes

RUN_DEPENDS=	${GIRDIR}/${poppler_GIR}.gir:${PORTSDIR}/${poppler_CATEGORY}/gir-repository-poppler \
		${GIRDIR}/${libnotify_GIR}.gir:${PORTSDIR}/${libnotify_CATEGORY}/gir-repository-libnotify \
		${GIRDIR}/${vte_GIR}.gir:${PORTSDIR}/${vte_CATEGORY}/gir-repository-vte \
		${GIRDIR}/${goocanvas_GIR}.gir:${PORTSDIR}/${goocanvas_CATEGORY}/gir-repository-goocanvas

do-install:	# empty

.include "${.CURDIR}/../../devel/gir-repository/bsd.gir.mk"
