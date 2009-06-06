# $MidnightBSD: mports/devel/automake110/Makefile,v 1.5 2008/06/12 17:43:49 crash Exp $

PORTNAME=	automake
PKGSUFFIXNAME=	110
PORTVERSION=	1.10.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.10)
LICENSE=	gpl2

RUN_DEPENDS=	${AUTOCONF_DEPENDS} \
		automake-wrapper:${PORTSDIR}/devel/automake-wrapper

USE_AUTOTOOLS=	autoconf:262:env
BUILD_VERSION=	1.10
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake110
USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION}
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
INFO=		automake-${BUILD_VERSION}

.include <bsd.port.pre.mk>

CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"

post-patch:
	@${RM} ${WRKSRC}/doc/*.info
	@${MV} ${WRKSRC}/doc/automake.texi \
	       ${WRKSRC}/doc/automake-${BUILD_VERSION}.texi

pre-su-install:
	@${RM} -fr ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/aclocal-${BUILD_VERSION}

.include <bsd.port.post.mk>
