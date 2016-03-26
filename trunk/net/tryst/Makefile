# $MidnightBSD$

PORTNAME=	tryst
PORTVERSION=	1.0.8
CATEGORIES=	net gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	tryst-108pl6
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of Apples Bonjour for GNUstep

LICENSE=	lgpl

DEPRECATED=	not supported on modern gnustep

USES=		gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_INSTALL=	yes
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

WRKSRC=		${WRKDIR}/Tryst-108.pl6

.if defined(FETCH_MAKESUM)
MASTER_SITES=	http://gnustep.dyndns.org/Downloads/Frameworks/
.endif

.include <bsd.port.pre.mk>

.if (${OSVERSION} < 3004)
LIB_DEPENDS=    dns_sd:${PORTSDIR}/net/mDNSResponder
.endif


# to build on 64bit
post-patch:
	${REINPLACE_CMD} -e 's|-Werror||' \
		${WRKSRC}/GNUmakefile.preamble

.include <bsd.port.post.mk>
