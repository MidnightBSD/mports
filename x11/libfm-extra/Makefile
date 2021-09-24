PORTNAME=	libfm
PKGNAMESUFFIX=	-extra

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	LibFM-Extra library

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2 =	${WRKSRC}/COPYING

MASTERDIR=	${.CURDIR}/../${PORTNAME}

DESCR=		${.CURDIR}/pkg-descr
FILESDIR=	${.CURDIR}/files
PATCHDIR=	${.CURDIR}/files
PLIST=		${.CURDIR}/pkg-plist

USE_LDCONFIG=	yes

EXTRA_ONLY=	yes

OPTIONS_EXCLUDE=	NLS

.include "${MASTERDIR}/Makefile"
