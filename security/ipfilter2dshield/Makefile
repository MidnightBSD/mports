# Created by: Joe Barbish <fbsd_user@a1poweruser.com>

PORTNAME=	ipfilter2dshield
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	security
MASTER_SITES=	http://www.dshield.org/clients/
DISTNAME=	dshield-freebsd.pl
EXTRACT_SUFX=	.txt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official DShield client for ipfilter firewall logs

LICENSE=	publicdom

RUN_DEPENDS=	p5-Net-Netmask>=0:net-mgmt/p5-Net-Netmask

USES=		perl5 shebangfix
SHEBANG_FILES=	${DISTNAME}

SUB_FILES=	pkg-message
SUB_LIST=	DISTNAME=${DISTNAME}

NO_BUILD=	yes
NO_ARCH=	yes
NO_WRKSUBDIR=	yes

do-extract:
	@${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/${DISTFILES} ${WRKSRC}/${DISTNAME}

do-install:
	@${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME} \
		${ETCDIR}/${DISTNAME}.sample
	${INSTALL_SCRIPT} ${WRKSRC}/${DISTNAME} ${PREFIX}/sbin/${DISTNAME}

.include <bsd.port.mk>
