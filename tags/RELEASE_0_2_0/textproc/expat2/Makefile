# New ports collection makefile for:	expat
# Date created:		Thu Aug 26 14:38:07 CEST 1999
# Whom:			Dirk Froemberg <dirk@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/expat2/Makefile,v 1.32 2006/02/23 10:39:20 ade Exp $
#

PORTNAME=	expat
PORTVERSION=	2.0.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	expat

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser written in C
LICENSE=	other

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
ALL_TARGET=	default
USE_LDCONFIG=	yes
MAN1=		xmlwf.1

SHLIB_MAJOR=	6

MAKE_ENV=	LIBCURRENT="${SHLIB_MAJOR}" \
		SHELL="/bin/sh"
PLIST_SUB=	SHLIB_MAJOR="${SHLIB_MAJOR}"

list-depend-ports:
	cd ${PORTSDIR}; \
	find . -mindepth 3 -maxdepth 3 -name Makefile -execdir sh -c \
		'find . -type f | grep -v CVS | xargs grep -q expat.5' \; \
		-print

.include <bsd.port.mk>
