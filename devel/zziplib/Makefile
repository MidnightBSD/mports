# $MidnightBSD: mports/devel/zziplib/Makefile,v 1.4 2009/04/08 20:11:58 laffer1 Exp $

PORTNAME=	zziplib
PORTVERSION=	0.13.50
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to provide transparent read access to zipped files
LICENSE=	lgpl

USE_PYTHON_BUILD=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

.include <bsd.port.mk>
