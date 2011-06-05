# New ports collection makefile for:    kwalletcli
# Date created:         6/5/2011
# Whom:                 Lucas Holt <luke@foolishgames.com>
#
# $MidnightBSD$

PORTNAME=	kwalletcli
PORTVERSION=	2.11
CATEGORIES=	security
MASTER_SITES=	https://www.mirbsd.org/MirOS/dist/hosted/kwalletcli/ \
		http://pub.allbsd.org/MirOS/dist/hosted/kwalletcli/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLI for the KDE Wallet
LICENSE=	other

MAKE_ENV=	BINDIR="${PREFIX}/bin/" KDE_INCS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" MANDIR="${PREFIX}/man/man"

WRKSRC=	${WRKDIR}/${PORTNAME}

MAKEFILE=	GNUmakefile
USE_GMAKE=	yes
USE_KDELIBS_VER=3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
