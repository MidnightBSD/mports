PORTNAME=	hw-probe
PORTVERSION=	1.6-beta
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hardware Probe Tool

LICENSE=	lgpl2.1

RUN_DEPENDS+=	dmidecode:sysutils/dmidecode \
		smartctl:sysutils/smartmontools \
		cpuid:misc/cpuid \
		curl:ftp/curl

USE_GITHUB=	yes
GH_ACCOUNT=	linuxhw

NO_BUILD=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/hw-probe.pl ${STAGEDIR}${PREFIX}/bin/hw-probe

.include <bsd.port.mk>
