# New ports collection makefile for:		qt-pgsql-plugin
# Date created:                         	5 August 2003
# Whom:                                        	Lauri Watts <lauri@kde.org>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/qt4-pgsql-plugin/Makefile,v 1.10 2008/08/04 23:30:31 miwi Exp $
#

PORTNAME=	qt4-${DB}-plugin
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt PostgreSQL database plugin
LICENSE=	gpl2

DB=		psql

USE_QT_VER=	4
QT_COMPONENTS=	moc_build sql
QT_NONSTANDARD=	yes

USE_PGSQL=	yes
DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=| ${TAR} -xf - \
		${DISTNAME}/${DRIVER} \
		${DISTNAME}/${PLUGIN}
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
PLIST_SUB=	DB=${DB}

.include <bsd.port.mk>
