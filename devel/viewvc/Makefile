# $MidnightBSD: mports/devel/viewvc/Makefile,v 1.7 2009/04/08 04:23:32 laffer1 Exp $

PORTNAME=	viewvc
PORTVERSION=	1.0.7
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	http://viewvc.tigris.org/files/documents/3330/44050/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing
LICENSE=	bsd2

RUN_DEPENDS=	${PYTHON_LIBDIR}/site-packages/svn/__init__.py:${PORTSDIR}/devel/py-subversion \
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
