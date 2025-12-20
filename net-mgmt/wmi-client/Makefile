PORTNAME=	wmi
PORTVERSION=	1.3.16
CATEGORIES=	net-mgmt
MASTER_SITES=	http://dev.zenoss.org/trac/export/26435/trunk/inst/externallibs/ \
		http://www.openvas.org/download/wmi/ \
		http://mirrors.rit.edu/zi/
PKGNAMESUFFIX=	-client

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DCOM/WMI client implementation

LICENSE=	gpl2

USES=		autoreconf:build gmake iconv tar:bzip2
MAKEFILE=	GNUmakefile
FAKE_MAKEARGS+=	ZENHOME="${PREFIX}" INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_LIB="${INSTALL_LIB}"
ALL_TARGET=	build

PROGS=	bin/wmic bin/winexe

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

do-install:
.for x in ${PROGS}
	${INSTALL_PROGRAM} ${WRKSRC}/Samba/source/${x} ${STAGEDIR}${PREFIX}/${x}
.endfor

.include <bsd.port.mk>
