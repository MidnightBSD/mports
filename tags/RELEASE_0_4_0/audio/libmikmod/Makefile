# ports collection makefile for:	libmikmod
# Date created:		Sun Apr 11 13:06:01 PDT 1999
# Whom:			Michael Haro <mharo@area51.fremont.ca.us>
#
# $MidnightBSD: mports/audio/libmikmod/Makefile,v 1.5 2011/02/02 20:03:22 laffer1 Exp $
# $FreeBSD: ports/audio/libmikmod/Makefile,v 1.42 2006/05/03 05:14:20 edwin Exp $
#

PORTNAME=	libmikmod
PORTVERSION=	3.1.11
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://mikmod.raphnet.net/files/
PATCH_SITES=	http://mikmod.raphnet.net/files/
PATCHFILES=	libmikmod-3.1.11-a.diff
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MikMod Sound Library
LICENSE=	lgpl

WANT_GNOME=	yes
USE_GNOME=	 lthack
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
MAKE_ENV=	SHELL=/bin/sh
USE_LDCONFIG=	yes

MAN1=		libmikmod-config.1
INFO=		mikmod

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mesound}!=""
USE_GNOME+=	esound
CONFIGURE_ARGS+=	--enable-esd
PKGNAMESUFFIX=	-esound
.else
CONFIGURE_ARGS+=	--disable-esd
.endif

post-extract:
	@${RM} -f ${WRKSRC}/docs/mikmod.info-*

post-patch:
	@${REINPLACE_CMD} \
		-e 's|\$$CFLAGS -pthread|\$$CFLAGS ${PTHREAD_CFLAGS}|g' \
		-e 's|-pthread \$$REENTRANT|\$$REENTRANT ${PTHREAD_CFLAGS}|g' \
		-e 's|-lpthread|${PTHREAD_LIBS:S/"//g}|g' \
		-e 's|-pthread|${PTHREAD_LIBS:S/"//g}|g' \
		-e 's|-lc_r|${PTHREAD_LIBS:S/"//g}|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
