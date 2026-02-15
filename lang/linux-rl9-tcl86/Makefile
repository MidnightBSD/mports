PORTNAME=	tcl
PORTVERSION=	8.6.10
DISTVERSIONSUFFIX=	-7.el9
CATEGORIES=	lang linux
PKGNAMESUFFIX=	86

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.tcl.tk/

LICENSE=        TclTk
LICENSE_NAME=   Tcl/Tk License
LICENSE_TEXT=	See https://www.tcl-lang.org/software/tcltk/license.html
LICENSE_PERMS=  dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

SKIP_FAKE_ALL=  yes

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
#USE_LINUX_RPM_BAD_PERMS=	yes

CONFLICTS=	linux-c7-${PORTNAME}${PKGNAMESUFFIX}
DATADIR=	${PREFIX}/usr/share/${PORTNAME}${PORTVERSION:R}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}${PKGNAMESUFFIX}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
