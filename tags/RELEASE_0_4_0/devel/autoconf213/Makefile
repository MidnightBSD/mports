# New ports collection makefile for:	autoconf
# Date created:		7 October 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/devel/autoconf213/Makefile,v 1.10 2011/02/02 19:48:21 laffer1 Exp $
# $FreeBSD: ports/devel/autoconf213/Makefile,v 1.62 2007/07/28 06:33:44 ade Exp $
#

PORTNAME=	autoconf
PKGNAMESUFFIX=	213
PORTVERSION=	2.13.000227
PORTREVISION=	8
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	ade/gnu
DISTNAME=	autoconf-000227

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically configure source code on many Un*x platforms (2.13)
LICENSE=	gpl2

FAKE_OPTS=	prefixhack

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4 \
		autoconf-wrapper:${PORTSDIR}/devel/autoconf-wrapper

BUILD_VERSION=	2.13
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	autoconf213
USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CONFIG_SHELL=${SH} M4=${LOCALBASE}/bin/gm4 AWK=${AWK}
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION}
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
WRKSRC=		${WRKDIR}/autoconf
INFO=		autoconf-${BUILD_VERSION}

STRIP=		# none

post-patch:
	@${RM} ${WRKSRC}/*.info* >/dev/null 2>&1 || true

post-install:
	@${CHMOD} +x ${PREFIX}/share/autoconf-${BUILD_VERSION}/config.*
	@${INSTALL_SCRIPT} ${WRKSRC}/install-sh \
		${PREFIX}/share/autoconf-${BUILD_VERSION}

.include <bsd.port.mk>
