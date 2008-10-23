# New ports collection Makefile for:	soprano
# Date created:				2008-01-18
# Whom:					arved
#
# $MidnightBSD: mports/textproc/soprano/Makefile,v 1.2 2008/10/21 00:36:22 laffer1 Exp $
# $FreeBSD: ports/textproc/soprano/Makefile,v 1.2 2008/08/08 22:37:30 miwi Exp $

PORTNAME=	soprano
PORTVERSION=	2.1.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QT4 RDF framework
LICENSE=	gpl2

LIB_DEPENDS=	clucene.0:${PORTSDIR}/textproc/clucene \
		rdf.0:${PORTSDIR}/textproc/redland

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus qtestlib qmake moc uic rcc network
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_CMAKE=	yes

MAKE_ARGS+=	${PTHREASD_LDFLAGS} DESTDIR=${FAKE_DESTDIR}
LDFLAGS+=	${PTHREAD_LDFLAGS}
MAKE_ENV+=	DESTDIR=${FAKE_DESTDIR}

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e "s,$${LIB_SUFFIX}/pkgconfig,data/pkgconfig," \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
