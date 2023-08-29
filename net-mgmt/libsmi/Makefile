PORTNAME=	libsmi
PORTVERSION=	0.4.8
PORTREVISION=	2
CATEGORIES=	net-mgmt
MASTER_SITES=	ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/ \
		FREEBSD_LOCAL/bms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access SMI MIB information
WWW=		https://www.ibr.cs.tu-bs.de/projects/libsmi/

LICENSE=	other

USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
USES=		cpe gmake libtool pathfix pkgconfig
CPE_VENDOR=	tu-braunschweig
PIBDIR=		${PREFIX}/share/smi/pibs
MIBDIR=		${PREFIX}/share/smi/mibs
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-data-dir=${PREFIX}/share/smi \
		--with-pibdir=${PIBDIR} --with-mibdir=${MIBDIR}

.include <bsd.port.mk>
