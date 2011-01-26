# New ports collection makefile for:	qca-tls
# Date created:				27 January 2004
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $FreeBSD: ports/security/qca-tls/Makefile,v 1.9 2006/08/21 10:08:24 demon Exp $
# $MidnightBSD: mports/security/qca-tls/Makefile,v 1.2 2007/03/25 01:45:31 ctriv Exp $
#

PORTNAME=	qca-tls
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	http://delta.affinix.com/download/qca/ \
		http://psi.affinix.com/beta/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SSL/TLS plugin for Qt
LICENSE=	lgpl

FAKE_MAKEARGS+= INSTALL_ROOT=${FAKE_DESTDIR}${PREFIX}/
BUILD_DEPENDS=	qmake:${PORTSDIR}/devel/qmake

HAS_CONFIGURE=	yes
USE_XLIB=	yes
USE_BZIP2=	yes
USE_OPENSSL=	yes
USE_QT_VER=	3
QT_NONSTANDARD=	yes
CONFIGURE_ENV=	QMAKESPEC=${LOCALBASE}/share/qt/mkspecs/freebsd-g++
CONFIGURE_ARGS=	--qtdir=${LOCALBASE} \
		--with-openssl-inc=${OPENSSLINC} --with-openssl-lib=${OPENSSLLIB}
MAKE_ARGS+=	QTDIR=${LOCALBASE} \
		QMAKESPEC=${LOCALBASE}/share/qt/mkspecs/freebsd-g++

PLIST_DIRS=	lib/plugins/crypto
PLIST_FILES=	lib/plugins/crypto/libqca-tls.so

.include <bsd.port.mk>
