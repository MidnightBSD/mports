PORTNAME=	hw-probe
PORTVERSION=	1.6.5
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Probe for hardware, check operability, and finding drivers
WWW=		https://bsd-hardware.info/

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

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
