# New ports collection makefile for:   libical
# Date created:        8 November 2002
# Whom:                Joe Kelsey
#
# $MidnightBSD: mports/devel/libical/Makefile,v 1.1 2007/03/09 05:18:07 laffer1 Exp $
# $FreeBSD: ports/devel/libical/Makefile,v 1.14 2007/02/01 02:41:28 kris Exp $
#

PORTNAME=	libical
PORTVERSION=	0.24
PORTREVISION=	3
DISTFILES=	${DISTNAME}.RC4${EXTRACT_SUFX}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	freeassociation

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the IETF's Calendaring and Scheduling protocols

USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
USE_LDCONFIG=	yes

.if !defined(WITHOUT_PYTHON)
CONFIGURE_ARGS=	--enable-python=yes
USE_PYTHON=	yes
PLIST_SUB+=     PYTHON:=""
.else
CONFIGURE_ARGS=	--enable-python=no
PLIST_SUB+=     PYTHON:="@comment "
.endif

.include <bsd.port.pre.mk>
.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
CONFIGURE_ENV=	CFLAGS="${CFLAGS} -fPIC"
.endif
.include <bsd.port.post.mk>
