PORTNAME=	sg3_utils
PORTVERSION=	1.48
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://sg.danny.cz/sg/p/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of utilities that send SCSI commands to devices
WWW=		https://sg.danny.cz/sg/sg3_utils.html

LICENSE=	bsd2 gpl2+
LICENSE_COMB=	multi
LICENSE_FILE_bsd2=	${WRKSRC}/BSD_LICENSE
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING

USES=		gmake libtool shebangfix tar:tgz

SHEBANG_FILES=	scripts/*

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd12.4
PLIST_SUB=	SOVERSION=${DISTVERSION}

post-install:
		@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libsgutils2*.so.*

.include <bsd.port.mk>
