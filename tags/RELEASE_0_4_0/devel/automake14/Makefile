# $MidnightBSD: mports/devel/automake14/Makefile,v 1.7 2011/02/02 20:17:32 laffer1 Exp $

PORTNAME=	automake
PKGNAMESUFFIX=	14
PORTVERSION=	1.4.6
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-1.4-p6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.4)
LICENSE=	gpl2

RUN_DEPENDS=	${AUTOCONF_DEPENDS} \
		automake-wrapper:${PORTSDIR}/devel/automake-wrapper

USE_AUTOTOOLS=	autoconf:env
BUILD_VERSION=	1.4
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake14
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION}
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
INFO=		automake-${BUILD_VERSION}

STRIP=		# none

post-patch:
	@${RM} ${WRKSRC}/*.info*
	@${MV} ${WRKSRC}/automake.texi ${WRKSRC}/automake-${BUILD_VERSION}.texi

pre-su-install:
	@${RM} -fr ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/aclocal-${BUILD_VERSION}

.include <bsd.port.mk>
