# $MidnightBSD: mports/security/libassuan/Makefile,v 1.3 2008/03/30 23:56:26 laffer1 Exp $

PORTNAME=	libassuan
PORTVERSION=	1.0.5
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme
LICENSE=	gpl3

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
