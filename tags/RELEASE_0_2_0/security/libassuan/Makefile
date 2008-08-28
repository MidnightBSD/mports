# New ports collection makefile for:	libassuan
# Date created:		2004-04-19
# Whom:			Michael Nottebrock <lofi@freebsd.org>
#
# $FreeBSD: ports/security/libassuan/Makefile,v 1.7 2006/12/05 12:20:11 lofi Exp $
# $MidnightBSD: mports/security/libassuan/Makefile,v 1.2 2007/10/12 20:52:43 laffer1 Exp $
#

PORTNAME=	libassuan
PORTVERSION=	1.0.4
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme

LIB_DEPENDS+=	pth.20:${PORTSDIR}/devel/pth

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
INFO=		assuan

CONFIGURE_ARGS+=--infodir=${PREFIX}/info

CFLAGS+=	-I${LOCALBASE}/include/pth

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.endif

.include <bsd.port.post.mk>
