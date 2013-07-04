# $MidnightBSD: mports/x11-toolkits/py-vte/Makefile,v 1.3 2011/05/28 06:23:35 laffer1 Exp $

PORTREVISION=	3
CATEGORIES=	x11-toolkits gnome python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface for VTE (Terminal widget)
LICENSE=	lgpl

MASTERDIR=	${.CURDIR}/../vte
BUILD_WRKSRC=	${WRKSRC}/python
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

USE_GNOME=	gnomehack  vte pygtk2
USE_PYTHON=	yes
CONFIGURE_ARGS=	--enable-python \
		--disable-freetypetest \
		--disable-Bsymbolic

.include "${MASTERDIR}/Makefile"
