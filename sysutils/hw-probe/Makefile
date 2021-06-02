PORTNAME=	hw-probe
DISTVERSION=	1.6beta2
PORTREVISION=	1
CATEGORIES=	sysutils
#DISTFILES=	hw-probe-1.6-beta_GH0.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Probe for hardware, check operability, and finding drivers

LICENSE=	lgpl2.1 bsd4
LICENSE_COMB=	dual

RUN_DEPENDS+=	dmidecode:sysutils/dmidecode \
		hwstat:sysutils/hwstat \
		lscpu:sysutils/lscpu \
		smartctl:sysutils/smartmontools \
		cpuid:misc/cpuid \
		curl:ftp/curl

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

USE_GITHUB=	yes
GH_ACCOUNT=	linuxhw
GH_PROJECT=	hw-probe 
GH_TAGNAME=	d1de28b

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
