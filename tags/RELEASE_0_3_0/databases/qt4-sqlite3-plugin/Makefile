# New ports collection makefile for:		qt-sqlite-plugin
# Date created:                         	27 February 2004
# Whom:                                        	Michael Nottebrock <lofi@freebsd.org>
#
# $MidnightBSD: mports/databases/qt4-sqlite3-plugin/Makefile,v 1.5 2010/01/09 23:10:44 laffer1 Exp $
# $FreeBSD: ports/databases/qt4-sqlite3-plugin/Makefile,v 1.10 2008/08/04 23:30:32 miwi Exp $
#

PORTNAME=	qt4-${DB}-plugin
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SQLite 3.x database plugin
LICENSE=	gpl2

DB=		sqlite

FAKE_OPTS=	trueprefix

USE_QT_VER=	4
QT_COMPONENTS=	moc_build sql
QT_NONSTANDARD=	yes
MAKE_JOBS_SAFE=	yes
DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=| ${TAR} -xf - \
		${DISTNAME}/${DRIVER} ${DISTNAME}/${PLUGIN} \
		${DISTNAME}/include/QtSql \
		${DISTNAME}/src/sql/kernel
MAKEFILE=	${FILESDIR}/Makefile.bsd

PLIST_SUB=	DB=${DB}


.include <bsd.port.pre.mk>


# old mbsd versions didn't come with sqlite in core.
.if ${OSVERSION} < 2000
LIB_DEPENDS+=	sqlite3:${PORTSDIR}/databases/sqlite3
.endif

MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		QT_INCDIR="${QT_INCDIR}" \
		QT_LIBDIR="${QT_LIBDIR}"
PLIST_SUB=	DB=${DB}

pre-install:
	@${MKDIR} ${PREFIX}/lib/qt4/plugins/sqldrivers


.include <bsd.port.post.mk>
