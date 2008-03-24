# New ports collection makefile for:	autoconf
# Date created:		7 October 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/devel/autoconf213/Makefile,v 1.5 2007/08/20 00:51:40 laffer1 Exp $
# $FreeBSD: ports/devel/autoconf213/Makefile,v 1.61 2005/06/17 02:56:07 ade Exp $
#

PORTNAME=	autoconf
PORTVERSION=	2.13.000227
PORTREVISION=	6
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ade/gnu
DISTNAME=	autoconf-000227

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically configure source code on many Un*x platforms (2.13)
LICENSE=	gpl2

DEPRECTATED=	Use 2.61 instead
EXPIRES=	March 31, 2008

FAKE_OPTS=	prefixhack

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	${BUILD_DEPENDS}

BUILD_VERSION=	213
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	autoconf${BUILD_VERSION}
USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CONFIG_SHELL=${SH} M4=${LOCALBASE}/bin/gm4
CONFIGURE_ARGS=	--program-suffix=${BUILD_VERSION}
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
WRKSRC=		${WRKDIR}/autoconf
INFO=		autoconf${BUILD_VERSION}

post-patch:
	@${RM} ${WRKSRC}/*.info* >/dev/null 2>&1 || true

post-install:
	@${CHMOD} +x ${PREFIX}/share/autoconf${BUILD_VERSION}/config.*
	@${INSTALL_SCRIPT} ${WRKSRC}/install-sh \
		${PREFIX}/share/autoconf${BUILD_VERSION}
	@-${RM} -fr ${PREFIX}/libexec/autoconf${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/libexec/autoconf${BUILD_VERSION}
.for i in autoconf autoheader autoreconf autoscan autoupdate ifnames
	@${LN} -sf ${PREFIX}/bin/${i}${BUILD_VERSION} \
		${PREFIX}/libexec/autoconf${BUILD_VERSION}/${i}
.endfor

.include <bsd.port.mk>
