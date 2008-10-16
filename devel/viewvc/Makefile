# New ports collection makefile for:	viewcvs
# Date created:				Sun 02 Jul 2000
# Whom:					will
#
# $FreeBSD: ports/devel/viewvc/Makefile,v 1.22 2006/07/26 19:01:22 mnag Exp $
# $MidnightBSD: mports/devel/viewvc/Makefile,v 1.5 2008/09/19 15:23:20 laffer1 Exp $
#

PORTNAME=	viewvc
PORTVERSION=	1.0.7
CATEGORIES=	devel python
MASTER_SITES=	http://viewvc.tigris.org/files/documents/3330/44050/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing
LICENSE=	bsd2

RUN_DEPENDS=	${PYTHON_LIBDIR}/site-packages/svn/__init__.py:${PORTSDIR}/devel/subversion-python \
		${PYTHON_LIBDIR}/site-packages/_mysql.so:${PORTSDIR}/databases/py-MySQLdb

USE_PYTHON=	yes
.if defined (WITH_APACHE)
USE_APACHE=	2.0+
.endif
NO_BUILD=	yes

SUB_FILES=	pkg-message
SUB_LIST=	INSTDIR="${PREFIX}/${INSTDIR}"

INSTDIR?=	${PORTNAME}
PLIST_SUB=	INSTDIR=${INSTDIR}

do-install:
	(cd ${WRKSRC} && ${PYTHON_CMD} viewvc-install --prefix=${TRUE_PREFIX}/${INSTDIR} --destdir=${FAKE_DESTDIR})

.include <bsd.port.mk>
