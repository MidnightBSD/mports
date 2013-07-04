# New ports collection makefile for:    kwalletcli
# Date created:         6/5/2011
# Whom:                 Lucas Holt <luke@foolishgames.com>
#
# $MidnightBSD: mports/security/kwalletcli/Makefile,v 1.3 2011/06/05 16:19:23 laffer1 Exp $

PORTNAME=	kwalletcli
PORTVERSION=	2.11
PORTREVISION=	1
CATEGORIES=	security kde
MASTER_SITES=	https://www.mirbsd.org/MirOS/dist/hosted/kwalletcli/ \
		http://pub.allbsd.org/MirOS/dist/hosted/kwalletcli/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLI for the KDE Wallet
LICENSE=	agg

MAKE_ENV=	BSD_PREFIX="${PREFIX}" KDE_INCS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" MANDIR="${PREFIX}/man/man"

WRKSRC=	${WRKDIR}/${PORTNAME}

MAKEFILE=	BSDmakefile
USE_KDELIBS_VER=3
MANCOMPRESSED=	yes
EXTENSIONS+=	kde

MAN1=	kwalletaskpass.1 \
	kwalletcli.1 \
	kwalletcli_getpin.1 \
	pinentry-kwallet.1

.include <bsd.port.mk>
