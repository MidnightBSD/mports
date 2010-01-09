# New ports collection makefile for:		qt-odbc-plugin
# Date created:                         	31 December 2003
# Whom:					Michael Nottebrock <lofi@freebsd.org>
#
# $MidnightBSD: mports/databases/qt4-odbc-plugin/Makefile,v 1.3 2008/10/13 17:51:02 ctriv Exp $
# $FreeBSD: ports/databases/qt4-odbc-plugin/Makefile,v 1.10 2008/08/04 23:30:31 miwi Exp $
#

PORTNAME=	qt4-${DB}-plugin
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt ODBC database plugin
LICENSE=	gpl2

DB=		odbc

FAKE_OPTS=	trueprefix

LIB_DEPENDS+=	odbc:${PORTSDIR}/databases/unixODBC

USE_QT_VER=	4
QT_COMPONENTS=	moc_build sql
QT_NONSTANDARD=	yes
MAKE_JOBS_SAFE=	yes

DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=| ${TAR} -xf - \
		${DISTNAME}/${DRIVER} \
		${DISTNAME}/${PLUGIN}
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		QT_INCDIR="${QT_INCDIR}" \
		QT_LIBDIR="${QT_LIBDIR}"
PLIST_SUB=	DB=${DB}

pre-fake:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/qt4/plugins/sqldrivers

.include <bsd.port.mk>
