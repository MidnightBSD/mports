# New ports collection makefile for:	qt-mysql-plugin
# Date created:				20 April 2003
# Whom:					Kay Lehmann <kay_lehmann@web.de>
#
# $MidnightBSD: mports/databases/qt4-mysql-plugin/Makefile,v 1.4 2008/10/13 17:50:03 ctriv Exp $
# $FreeBSD: ports/databases/qt4-mysql-plugin/Makefile,v 1.10 2008/08/04 23:30:30 miwi Exp $

PORTNAME=	qt4-${DB}-plugin
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt MySQL database plugin
LICENSE=	gpl2

DB=		mysql

FAKE_OPTS=	trueprefix

USE_QT_VER=	4
QT_COMPONENTS=	moc_build sql
QT_NONSTANDARD=	yes
MAKE_JOBS_SAFE=	yes

USE_MYSQL=	yes
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
