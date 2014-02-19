# $MidnightBSD$

PORTNAME=	dirdiff
PORTVERSION=	2.1
CATEGORIES=	sysutils tcl tk
MASTER_SITES=	ftp://ftp.samba.org/pub/paulus/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical diff tool

LICENSE=	gpl2

USE_TK=		yes
USE_LDCONFIG=	yes

PLIST_FILES=	bin/dirdiff lib/libfilecmp.so.0

CFLAGS+=	-fPIC -I${TCL_INCLUDEDIR}

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e \
		's|.0.0|.0|g ; \
		 s|^CFLAGS=|CFLAGS?=|g' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e \
		's|^exec wish |exec ${WISH:T} |' ${WRKSRC}/dirdiff

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/dirdiff ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/libfilecmp.so.0 ${PREFIX}/lib

.include <bsd.port.mk>
