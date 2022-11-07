PORTNAME=	lttng-ust
PORTVERSION=	2.9.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://lttng.org/files/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries to instrument and trace user applications
WWW=		https://github.com/lttng/lttng-ust

LICENSE=		lgpl2.1 mit gpl2
LICENSE_COMB=		dual
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING
LICENSE_FILE_mit=	${WRKSRC}/COPYING
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING

BUILD_DEPENDS=	asciidoc:textproc/asciidoc \
		xmlto:textproc/xmlto
LIB_DEPENDS=	liburcu.so:sysutils/liburcu

USES=		autoreconf gmake libtool localbase pathfix python \
		shebangfix tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
# XXX: build fails if cmake is detected, see PR 253327
CONFIGURE_ENV=	ac_cv_prog_HAVE_CMAKE=no
INSTALL_TARGET=	install-strip
# magus incomatibility
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	@${GREP} -Rl --null '#!/bin/bash' ${WRKSRC}/tests | ${XARGS} -0 \
		${REINPLACE_CMD} -e '/#!/s,bash,sh,'

.include <bsd.port.mk>
