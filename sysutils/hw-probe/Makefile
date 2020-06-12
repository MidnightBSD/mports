PORTNAME=	hw-probe
DISTVERSION=	1.6beta
PORTREVISION=	1
CATEGORIES=	sysutils
DISTFILES=	hw-probe-1.6-beta_GH0.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hardware Probe Tool

LICENSE=	lgpl2.1

RUN_DEPENDS+=	dmidecode:sysutils/dmidecode \
		smartctl:sysutils/smartmontools \
		cpuid:misc/cpuid \
		curl:ftp/curl

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

USE_GITHUB=	yes
GH_ACCOUNT=	linuxhw
GH_PROJECT=	hw-probe 
GH_TAGNAME=		1.6-beta 

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${STAGEDIR}${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
