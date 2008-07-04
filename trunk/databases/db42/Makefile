# ports collection makefile for:	Berkeley DB v4.2
# Date created:				2003-11-26
# Whom:					Matthias Andree <matthias.andree@gmx.de>
#
# $FreeBSD: ports/databases/db42/Makefile,v 1.63 2005/04/13 07:31:27 leeym Exp $
# $MidnightBSD: mports/databases/db42/Makefile,v 1.3 2007/11/11 00:10:21 laffer1 Exp $
# 

PORTNAME=	db42
PORTVERSION=	4.2.52
PORTREVISION=	6
CATEGORIES=	databases
PKGNAMESUFFIX?=

PATCHFILES=	patch.${PORTVERSION}.1  patch.${PORTVERSION}.2 \
		patch.${PORTVERSION}.3  patch.${PORTVERSION}.4 \
		patch.${PORTVERSION}.5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4.2
LICENSE=	bdb

MASTERDIR?=	${.CURDIR}

SLAVE_PORT=	no

.include <${MASTERDIR}/Makefile.db>
.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--with-mutex=x86/gcc-assembly
.endif

.include <bsd.port.post.mk>
