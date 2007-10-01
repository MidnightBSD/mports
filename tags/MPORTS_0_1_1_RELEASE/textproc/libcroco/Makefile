# New ports collection makefile for:	libcroco
# Date created:				08 July 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/libcroco/Makefile,v 1.17 2006/11/05 03:51:39 mezz Exp $
#

PORTNAME=	libcroco
PORTVERSION=	0.6.1
CATEGORIES=	textproc gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/0.6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS2 parsing library

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 libxml2 ltverhack

PLIST_SUB=	VERSION="0.6"

.include <bsd.port.mk>
