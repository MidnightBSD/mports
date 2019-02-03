# $MidnightBSD$
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

USE_QT4=	moc_build sql
QT_DIST=	yes
USE_SQLITE=	3

DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=	${DISTNAME}/${DRIVER} ${DISTNAME}/${PLUGIN} \
			${DISTNAME}/include/QtSql \
			${DISTNAME}/src/corelib \
			${DISTNAME}/src/sql/kernel
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		QT_INCDIR="${QT_INCDIR}" \
		QT_LIBDIR="${QT_LIBDIR}"
PLIST_SUB=	DB=${DB}

EXTRA_PATCHES=	# empty

SQL_PLUGINDIR=	${PREFIX}/${QT_PLUGINDIR_REL}/sqldrivers

do-install:
	@${MKDIR} ${SQL_PLUGINDIR}
	${INSTALL_LIB} ${WRKSRC}/libq${DB}.so ${STAGEDIR}${SQL_PLUGINDIR}

.include <bsd.port.mk>
