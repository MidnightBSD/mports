PORTNAME=	gsm
PORTVERSION=	1.0.19
CATEGORIES=	audio
MASTER_SITES=	http://www.quut.com/gsm/ \
 		http://downloads.openwrt.org/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio converter and library for converting u-law to gsm encoding

LICENSE=	TU-BERLIN
LICENSE_NAME=	Technische Universitaet Berlin copyright
LICENSE_FILE=	${WRKSRC}/COPYRIGHT
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

FAKE_OPTS=	trueprefix

WRKSRC=		${WRKDIR}/gsm-1.0-pl19

USE_LDCONFIG=	yes

.include <bsd.port.mk>
