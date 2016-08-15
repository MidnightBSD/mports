# $MidnightBSD$
# $FreeBSD: ports/databases/qt4-pgsql-plugin/Makefile,v 1.10 2008/08/04 23:30:31 miwi Exp $

PORTNAME=	qt4-${DB}-plugin
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt PostgreSQL database plugin
LICENSE=	gpl3

FAKE_OPTS=	trueprefix

DB=		psql

USE_QT4=	moc_build sql
QT_DIST=	yes

USE_PGSQL=	yes
DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=	${DISTNAME}/${DRIVER} \
			${DISTNAME}/src/corelib \
			${DISTNAME}/${PLUGIN}
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
	${INSTALL_LIB} ${WRKSRC}/libqsql${DB}.so ${SQL_PLUGINDIR}

.include <bsd.port.mk>
