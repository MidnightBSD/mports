PORTNAME=	hw-probe
PORTVERSION=	1.6.6
PORTREVISION=	1
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
GH_TAGNAME=	601bc1f0220a45bf532075a96ce43f667a4bf83d

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
