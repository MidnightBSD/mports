# ex:ts=8
# Ports collection makefile for:	classpath
# Date created:			Sep 1, 2004
# Whom:				ijliao
#
# $MidnightBSD: mports/java/classpath/Makefile,v 1.1 2006/10/06 02:42:53 laffer1 Exp $
# $FreeBSD: ports/java/classpath/Makefile,v 1.23 2006/05/14 01:13:38 itetcu Exp $
#

PORTNAME=	classpath
PORTVERSION=	0.90
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_GNU} \
		${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNU project to create a free Java class library
LICENSE=	gpl2

BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip

USE_JAVA=	yes
USE_JIKES=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-jni --with-jikes --disable-gtk-peer
USE_GMAKE=	yes

INFO=		hacking vmintegration

.include <bsd.port.mk>
