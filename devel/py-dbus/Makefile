# New ports collection makefile for:   py-dbus
# Date Created:			25 July 2004
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/devel/py-dbus/Makefile,v 1.2 2008/10/13 20:41:32 laffer1 Exp $
# $FreeBSD: ports/devel/py-dbus/Makefile,v 1.22 2007/03/20 22:11:54 pav Exp $
#    $MCom: ports/devel/py-dbus/Makefile,v 1.8 2007/03/01 05:52:46 marcus Exp $

PORTNAME=	dbus
PORTVERSION=	0.80.2
CATEGORIES=	devel gnome python
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the D-BUS messaging system
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_GNOME=	gnomehack gnometarget
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

post-install:
.if defined(NOPORTDOCS)
	@${RM} -rf ${PREFIX}/share/doc/dbus-python
.else
	@${MV} ${PREFIX}/share/doc/dbus-python ${DOCSDIR} && \
		${MKDIR} ${EXAMPLESDIR} && \
		${INSTALL_DATA} ${WRKSRC}/examples/*.py ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
