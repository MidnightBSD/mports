PORTNAME=	libassuan
PORTVERSION=	2.5.5
DISTVERSIONSUFFIX=	-3.el9
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://gnupg.org/related_software/libassuan/index.en.html

LICENSE=	lgpl2.1+

USES=		cpe linux:rl9
CPE_VENDOR=	gnupg
USE_LDCONFIG=	yes
USE_LINUX=	libgpg-error
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
