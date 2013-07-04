# $MidnightBSD: mports/security/libassuan/Makefile,v 1.5 2010/08/01 05:15:01 laffer1 Exp $

PORTNAME=	libassuan
PORTVERSION=	2.0.2
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=${PORTNAME}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme
LICENSE=	gpl3

LIB_DEPENDS+=	pth.20:${PORTSDIR}/devel/pth \
		gpg-error:${PORTSDIR}/security/libgpg-error

CONFLICTS=	libassuan-1-1*

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

# Silly, but apparently the only way to get the proper shared lib version number
USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack

INFO=		assuan
PLIST_FILES=	bin/libassuan-config include/assuan.h \
		lib/libassuan.a lib/libassuan.la \
		lib/libassuan.so.0 lib/libassuan.so share/aclocal/libassuan.m4

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.endif

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

.include <bsd.port.post.mk>
