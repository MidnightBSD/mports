# New ports collection makefile for:	glib20-reference
# Date created:				09 May 2006
# Whom:					Jean-Yves Lefort <jylefort@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/glib20-reference/Makefile,v 1.2 2006/05/31 22:18:43 mezz Exp $
#

PORTREVISION=	0

BOOKS=		glib gobject

glib_MAN=	glib-gettextize.1
gobject_MAN=	glib-genmarshal.1 glib-mkenums.1 gobject-query.1

MAN1=		${glib_MAN} ${gobject_MAN}

post-install:
.for m in glib gobject
	${INSTALL_MAN} ${${m}_MAN:S|^|${REFERENCE_SRC}/${m}/|} \
		${PREFIX}/man/man1
.endfor

.include "${.CURDIR}/../../devel/glib20-reference/bsd.gnome-reference.mk"
