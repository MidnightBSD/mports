# New ports collection makefile for:	libdts
# Date created:				12th May 2004
# Whom:					Pav Lucistnik <pav@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/libdts/Makefile,v 1.1 2006/10/05 01:12:45 laffer1 Exp $
# $FreeBSD: ports/multimedia/libdts/Makefile,v 1.4 2006/08/30 08:08:37 pav Exp $
#

PORTNAME=	libdts
PORTVERSION=	0.0.2
PORTREVISION=	2
CATEGORIES=	multimedia
MASTER_SITES=	http://debian.unnet.nl/pub/videolan/libdts/${PORTVERSION}/ \
		http://download.videolan.org/pub/videolan/libdts/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free DTS Coherent Acoustics decoder
LICENSE=        gpl2
GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig gnomehack

MAN1=		dtsdec.1 extract_dts.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
post-patch:
	@${REINPLACE_CMD} -e 's|-ldts|-ldts_pic|' ${WRKSRC}/libdts/libdts.pc.in
.endif

.include <bsd.port.post.mk>
