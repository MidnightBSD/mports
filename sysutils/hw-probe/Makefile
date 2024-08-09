PORTNAME=	hw-probe
PORTVERSION=	1.6.6
PORTREVISION=	2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Probe for hardware, check operability, and finding drivers
WWW=		https://bsd-hardware.info/

LICENSE=	lgpl2.1 bsd4
LICENSE_COMB=	dual

RUN_DEPENDS+=	dmidecode:sysutils/dmidecode \
		hwstat:sysutils/hwstat \
		lsblk:sysutils/lsblk \
		lscpu:sysutils/lscpu \
		smartctl:sysutils/smartmontools \
		cpuid:misc/cpuid \
		curl:ftp/curl

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

USE_GITHUB=	yes
GH_ACCOUNT=	linuxhw
GH_TAGNAME=	405bd9070dbeb9a3c8de7a226923c2eab59cbe63

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
