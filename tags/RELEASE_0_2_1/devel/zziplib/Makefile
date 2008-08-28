# New ports collection makefile for:   zziplib
# Date created:        3 January 2001
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/zziplib/Makefile,v 1.17 2006/09/07 06:24:37 ale Exp $
#

PORTNAME=	zziplib
PORTVERSION=	0.13.47
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to provide transparent read access to zipped files

USE_BZIP2=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

.include <bsd.port.mk>
