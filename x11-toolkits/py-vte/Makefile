# $MidnightBSD: mports/x11-toolkits/py-vte/Makefile,v 1.1 2008/03/22 16:42:57 laffer1 Exp $

PORTREVISION=	2
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

USE_GNOME=	gnomehack gnometarget vte pygtk2
USE_PYTHON=	yes
CONFIGURE_ARGS=	--enable-python \
		--disable-freetypetest

.include "${MASTERDIR}/Makefile"
