PORTNAME=	sg3_utils
PORTVERSION=	1.48
CATEGORIES=	sysutils
MASTER_SITES=	http://sg.danny.cz/sg/p/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of utilities that send SCSI commands to devices

LICENSE=	bsd3

USES=		gmake libtool

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd12.4
PLIST_SUB=	SOVERSION=${DISTVERSION}

.include <bsd.port.mk>
