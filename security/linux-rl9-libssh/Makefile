PORTNAME=	libssh
PORTVERSION=	0.10.4
DISTVERSIONSUFFIX=	-13.el9
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library implementing the SSH2 protocol (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.libssh.org/

LICENSE=	lgpl2.1

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
