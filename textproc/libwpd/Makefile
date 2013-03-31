# New ports collection makefile for:    libwpd
# Date created:         Mon May 19 09:09:10 PDT 2003
# Whom:                 reed@pugetsoundtechnology.com
#
# $FreeBSD: ports/textproc/libwpd/Makefile,v 1.18 2006/02/23 10:39:24 ade Exp $
# $MidnightBSD: mports/textproc/libwpd/Makefile,v 1.6 2010/01/02 20:10:28 laffer1 Exp $
#

PORTNAME=	libwpd
PORTVERSION=	0.9.6
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for importing and exporting WordPerfect(tm) documents
LICENSE=	lgpl

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack libgsf
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

CONFIGURE_ARGS+=--disable-werror --without-docs
PLIST_SUB=	MAJVER=${PORTVERSION:R}

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS = / s| docs||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
