# New ports collection makefile for:	c_c++_reference.tar.gz
# Date created:        8 March 2000
# Whom:                imura@af.airnet.ne.jp
#
# $MidnightBSD: mports/devel/c_c++_reference/Makefile,v 1.2 2008/08/24 20:53:40 laffer1 Exp $
# $FreeBSD: ports/devel/c_c++_reference/Makefile,v 1.18 2007/05/19 20:02:12 flz Exp $
#

PORTNAME=	c_c++_reference
PORTVERSION=	2.0.2
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.ee.fhm.edu/pub/unix/ide/KDevelop/
DISTNAME=	c_cpp_reference-${PORTVERSION}_for_KDE_3.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C/C++ reference manual for KDevelop
LICENSE=	unknown

RUN_DEPENDS=	kdevelop:${PORTSDIR}/devel/kdevelop

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool:22
USE_KDELIBS_VER=	3
USE_GMAKE=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--build=${MACHINE_ARCH}-portbld-freebsd6.0

post-patch:
	${REINPLACE_CMD} -e 's,-lqt,-lqt-mt -pthread,' ${WRKSRC}/configure

.include <bsd.port.mk>
