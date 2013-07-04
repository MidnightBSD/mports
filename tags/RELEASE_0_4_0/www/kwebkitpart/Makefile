# $MidnightBSD$
# $FreeBSD: ports/www/kwebkitpart/Makefile,v 1.4 2010/09/02 21:57:30 makc Exp $

PORTNAME=	kwebkitpart
PORTVERSION=	0.9.6.b1
CATEGORIES=	www kde
MASTER_SITES=	http://opendesktop.org/CONTENT/content-files/
DISTNAME=	127960-${PORTNAME}-0.9.6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser component for KDE based on QtWebKit
LICENSE=	lgpl

USE_BZIP2=	yes
USE_KDE4=	automoc4 kdehier kdelibs kdeprefix
USE_QT_VER=	4
QT_COMPONENTS=	designer webkit \
		moc_build qmake_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes
USE_CMAKE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-0.9.6

.include <bsd.port.mk>
