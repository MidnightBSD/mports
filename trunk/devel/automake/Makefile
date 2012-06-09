# $MidnightBSD: mports/devel/automake/Makefile,v 1.1 2011/02/02 19:48:21 laffer1 Exp $
# $FreeBSD: ports/devel/automake/Makefile,v 1.38 2010/12/08 19:58:44 ade Exp $

PORTNAME=	automake
PORTVERSION=	1.12
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator
LICENSE=	gpl3

RUN_DEPENDS=	${AUTOCONF_DEPENDS} \
		automake-wrapper:${PORTSDIR}/devel/automake-wrapper

USE_AUTOTOOLS=	autoconf:env
BUILD_VERSION=	1.12
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
USE_XZ=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION}
CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"
INFO=		automake
MAN1=		aclocal-${BUILD_VERSION}-${BUILD_VERSION}.1 \
		aclocal-${BUILD_VERSION}.1 \
		automake-${BUILD_VERSION}-${BUILD_VERSION}.1 \
		automake-${BUILD_VERSION}.1

post-patch:
	@${RM} ${WRKSRC}/doc/*.info

pre-su-install:
	@${RM} -fr ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/aclocal-${BUILD_VERSION}

.include <bsd.port.mk>
