# New ports collection makefile for:	zebra-server
# Date created:				14 Nov 2000
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net/zebra-server/Makefile,v 1.17 2007/03/03 18:34:37 kris Exp $
#

PORTNAME=	zebra-server
PORTVERSION=	1.3.24
CATEGORIES=	net
MASTER_SITES=	http://ftp.indexdata.dk/pub/zebra/
DISTNAME=	idzebra-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Z39.50/SR server software
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/bin/tclsh8.4:${PORTSDIR}/lang/tcl84
LIB_DEPENDS=	yaz.2:${PORTSDIR}/net/yaz
RUN_DEPENDS=	${LOCALBASE}/bin/tclsh8.4:${PORTSDIR}/lang/tcl84

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-yaz=${LOCALBASE}/bin \
		--with-tclconfig=${LOCALBASE}/lib/tcl8.4 \
		--with-iconv=${LOCALBASE} --with-expat=${LOCALBASE}
CONFIGURE_ENV+=	PTHREAD_LIBS=${PTHREAD_LIBS}

MAN1=		zebraidx.1
MAN8=		zebrasrv.8

.include <bsd.port.mk>
