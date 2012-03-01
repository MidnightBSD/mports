# $MidnightBSD: mports/databases/qt4-sqlite3-plugin/Makefile,v 1.7 2011/07/23 23:11:12 laffer1 Exp $
# $FreeBSD: ports/databases/qt4-sqlite3-plugin/Makefile,v 1.15 2010/12/02 19:47:03 makc Exp $

PORTNAME=	qt4-${DB}-plugin
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SQLite 3.x database plugin
LICENSE=	gpl3

DB=		sqlite
DISTINFO_FILE=	${PORTSDIR}/devel/qt4/distinfo

FAKE_OPTS=	trueprefix

USE_QT_VER=	4
QT_COMPONENTS=	moc_build sql
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes

DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=| ${TAR} -xf - \
		${DISTNAME}/${DRIVER} ${DISTNAME}/${PLUGIN} \
		${DISTNAME}/include/QtSql \
		${DISTNAME}/src/sql/kernel
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		QT_INCDIR="${QT_INCDIR}" \
		QT_LIBDIR="${QT_LIBDIR}"
PLIST_SUB=	DB=${DB}

pre-install:
	@${MKDIR} ${PREFIX}/lib/qt4/plugins/sqldrivers

.include <bsd.port.mk>
