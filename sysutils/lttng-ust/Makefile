# $MidnightBSD$

PORTNAME=	lttng-ust
PORTVERSION=	2.9.0
CATEGORIES=	sysutils
MASTER_SITES=	http://lttng.org/files/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries to instrument and trace user applications

LICENSE=		lgpl2.1 mit gpl2
LICENSE_COMB=		dual
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING
LICENSE_FILE_mit=	${WRKSRC}/COPYING
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING

LIB_DEPENDS=	liburcu.so:sysutils/liburcu

USES=		autoreconf libtool localbase pathfix python \
	    shebangfix tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
# magus incomatibility
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|%%PYTHON_VERSION%%|${PYTHON_VERSION}|g' \
	    ${PATCH_WRKSRC}/tools/lttng-gen-tp

.include <bsd.port.mk>
