# New ports collection makefile for:    libwpd
# Date created:         Mon May 19 09:09:10 PDT 2003
# Whom:                 reed@pugetsoundtechnology.com
#
# $FreeBSD: ports/textproc/libwpd/Makefile,v 1.18 2006/02/23 10:39:24 ade Exp $
# $MidnightBSD: mports/textproc/libwpd/Makefile,v 1.5 2007/10/03 20:28:49 laffer1 Exp $
#

PORTNAME=	libwpd
PORTVERSION=	0.8.14
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for importing and exporting WordPerfect(tm) documents
LICENSE=	lgpl

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack libgsf
USE_LDCONFIG=	yes
ALL_TARGET=	-j`${SYSCTL} -n hw.ncpu`

CONFIGURE_ARGS+=--without-docs

.include <bsd.port.mk>
